Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr70049.outbound.protection.outlook.com ([40.107.7.49]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2FVM-0002ki-FI
 for ath11k@lists.infradead.org; Sun, 02 Aug 2020 15:02:31 +0000
From: Shay Bar <Shay.Bar@celeno.com>
Subject: Re: [PATCH V2 06/10] ath11k: pass multiple bssid info to FW when a
 new vdev is created
Date: Sun, 2 Aug 2020 15:02:23 +0000
Message-ID: <AM0P192MB0468CC75648CE04D26CF58C3E74C0@AM0P192MB0468.EURP192.PROD.OUTLOOK.COM>
References: <20200706115219.663650-1-john@phrozen.org>
 <20200706115219.663650-6-john@phrozen.org>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

On 06/07/2020 14:52, John Crispin wrote:
> -static void
> +static int
>  ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
>                                     struct vdev_create_params *params)
>  {
>         struct ath11k *ar = arvif->ar;
>         struct ath11k_pdev *pdev = ar->pdev;
> +       struct ieee80211_vif *parent;
>
>         params->if_id = arvif->vdev_id;
>         params->type = arvif->vdev_type;
>         params->subtype = arvif->vdev_subtype;
>         params->pdev_id = pdev->pdev_id;
> +       params->vdevid_trans = 0;
> +       switch (ieee80211_get_multi_bssid_mode(arvif->vif)) {
> +       case NL80211_MULTIPLE_BSSID_TRANSMITTED:
> +               params->flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
> +               break;
> +       case NL80211_MULTIPLE_BSSID_NON_TRANSMITTED:
> +               params->flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
> +               parent = ieee80211_get_multi_bssid_parent(arvif->vif);
> +               if (!parent)
> +                       return -ENOENT;
> +               if (ar->hw->wiphy != ieee80211_vif_to_wdev(parent)->wiphy)
> +                       return -EINVAL;
> +               params->vdevid_trans = ath11k_vif_to_arvif(parent)->vdev_id;
> +               break;
> +       default:
> +               params->flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
> +               break;
> +       }

Hi John,
The ath11k_mac_setup_vdev_create_params() is called from the add_interface hook
which is called from ieee80211_do_open() which is, for the first (TRANSMITTED)
interface, before wdev->multi_bssid_mode is set to NL80211_MULTIPLE_BSSID_TRANSMITTED
(set upon start_ap from hostapd).
Can you please explain how wdev->multi_bssid_mode can have
NL80211_MULTIPLE_BSSID_TRANSMITTED value in the above code ?

________________________________
The information transmitted is intended only for the person or entity to which it is addressed and may contain confidential and/or privileged material. Any retransmission, dissemination, copying or other use of, or taking of any action in reliance upon this information is prohibited. If you received this in error, please contact the sender and delete the material from any computer. Nothing contained herein shall be deemed as a representation, warranty or a commitment by Celeno. No warranties are expressed or implied, including, but not limited to, any implied warranties of non-infringement, merchantability and fitness for a particular purpose.
________________________________


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

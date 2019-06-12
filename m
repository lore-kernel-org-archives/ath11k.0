Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb6DD-0006k8-VT
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 16:35:01 +0000
Received: by mail-it1-x142.google.com with SMTP id l21so11841779ita.2
 for <ath11k@lists.infradead.org>; Wed, 12 Jun 2019 09:34:59 -0700 (PDT)
Date: Wed, 12 Jun 2019 12:34:57 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [RFC PATCH v2 3/3] ath11k: register HE mesh capabilities
Message-ID: <20190612163457.GB4090@localhost>
References: <20190611180247.19524-1-sven@narfation.org>
 <20190611180247.19524-4-sven@narfation.org>
 <1919330.hVZVHELXip@bentobox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1919330.hVZVHELXip@bentobox>
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
To: Sven Eckelmann <seckelmann@datto.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Tue, Jun 11, 2019 at 09:52:20PM +0200, Sven Eckelmann wrote:
> On Tuesday, 11 June 2019 20:02:47 CEST Sven Eckelmann wrote:
> [...]
> > ---
> > This doesn't work currently as expected. No HE rates are used between
> > the two HE mesh peers:
> [...]
> 
> There seems to be also an ordering problem. ath11k_peer_assoc_h_he is only 
> called before ieee80211_he_cap_ie_to_sta_he_cap is called. So ath11k_bss_assoc 
> will not have the information whether the remote has HE support or not.
> 
> Looks like I have adjust mesh_sta_info_init to get this somehow to 
> ath11k_peer_assoc_h_he. Maybe through ath11k_sta_rc_update but this is not 
> called by mesh_sta_info_init at the moment. Just because 
> rate_control_rate_init is called and not rate_control_rate_update.
> 
> The easiest method seems to adjust the check at the end of mesh_sta_info_init 
> to 
> 
> 	if (!test_sta_flag(sta, WLAN_STA_RATE_CONTROL) &&
> 	    !ieee80211_hw_check(&local->hw, HAS_RATE_CONTROL)) {
> 		rate_control_rate_init(sta);
> 	} else {
> 		rate_control_rate_update(local, sband, sta, changed);
> 	}

Maybe we should just do this?

diff --git a/net/mac80211/rate.c b/net/mac80211/rate.c
index 76f303fda3ed..6f8bde840bb9 100644
--- a/net/mac80211/rate.c
+++ b/net/mac80211/rate.c
@@ -42,7 +42,7 @@ void rate_control_rate_init(struct sta_info *sta)
 	ieee80211_sta_set_rx_nss(sta);
 
 	if (!ref)
-		return;
+		goto out;
 
 	rcu_read_lock();
 
@@ -59,6 +59,7 @@ void rate_control_rate_init(struct sta_info *sta)
 			    priv_sta);
 	spin_unlock_bh(&sta->rate_ctrl_lock);
 	rcu_read_unlock();
+out:
 	set_sta_flag(sta, WLAN_STA_RATE_CONTROL);
 }


That was my intent, anyway -- that NSS always got set before
rate_control_rate_update() even if using HW rate control.

> 	if (!test_sta_flag(sta, WLAN_STA_RATE_CONTROL))
> 		rate_control_rate_init(sta);
> 
>    /* inform drivers about changes */
> 	rate_control_rate_update(local, sband, sta, changed);
> 
> Both will at least cause a call to ath11k_peer_assoc_prepare + 
> ath11k_wmi_send_peer_assoc_cmd but unfortunately the ath11k firmware hangs 
> afterwards.

I think this would be OK.

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

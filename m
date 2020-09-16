Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kINHQ-0002cR-6t
 for ath11k@lists.infradead.org; Wed, 16 Sep 2020 02:34:48 +0000
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 10:33:51 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v5 2/8] ath11k: add support for 6GHz radio in driver
In-Reply-To: <0b4f6d618388a97082009ba5380afbf5@codeaurora.org>
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
 <20200603001724.12161-3-pradeepc@codeaurora.org>
 <a5cac45b02396c98628738cef7f92ad1@codeaurora.org>
 <e08a20b99363d68626bc38b6e3d2fcfd@codeaurora.org>
 <0b4f6d618388a97082009ba5380afbf5@codeaurora.org>
Message-ID: <ec7637b9d8b5f7c5227dd90a00f50eeb@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-09-16 07:07, Pradeep Kumar Chitrapu wrote:
>>>> 
>>>> -	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
>>>> +	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP && 
>>>> !ar->supports_6ghz) {
>>>>  		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
>>>>  		ht_cap = cap->band[NL80211_BAND_5GHZ].ht_cap_info;
>>>>  		if (ht_cap_info)
>>> After this change, when 6G is support, it removed HT/VHT of 5G band
>>> from "iw list", when connect to an 11AX AP of 5G, it used non-HT.
>>> caused together with this commit
>>> 75e296e9b22aef6fa467523ace87ef623dac1fad(mac80211: simplify and
>>> improve HT/VHT/HE disable code)
>>> +       /* disable HT/VHT/HE if we don't support them */
>>> +       if (!sband->ht_cap.ht_supported) {
>>> +               ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
>>> +               ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
>>> +               ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
>>> +       }
>>> 
>>> after remove this change in ath11k, it become correct to HE
>>> iw wls1 station dump:
>>> rx bitrate:     149.7 MBit/s HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
> Hi Wen,
> 
> Do you have
> https://lore.kernel.org/linux-wireless/20200528213443.25687d2695bc.I3f9747c1147480f65445f13eda5c4a5ed4e86757@changeid/?
yes, I have it.
> 
>>> 
>> Hi Pradeep Kumar Chitrapu,
>> For QCA6390, it is single_pdev, the pdev support all 2G/5G/6G,
>> Is it have 3 pdev/ath11k in your chip for 2G/5G/6G?
>> And the pdev/ath11k of 6G have WMI_HOST_WLAN_5G_CAP of 
>> cap->supported_bands?
>>> [...]
> Yes, ath11k receives WMI_HOST_WLAN_5G_CAP from firmware for 6G as well.
Ok, so it need to add logic for single_pdev for it(single_pdev is added 
in 
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k?id=5f859bc02c7bc7a4094bfba0b4ed145edd7661f2, 
it is later than your 6G patches), maybe I will add it later.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

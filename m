Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIA9W-0000r6-T4
 for ath11k@lists.infradead.org; Tue, 15 Sep 2020 12:33:50 +0000
MIME-Version: 1.0
Date: Tue, 15 Sep 2020 20:32:53 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v5 2/8] ath11k: add support for 6GHz radio in driver
In-Reply-To: <a5cac45b02396c98628738cef7f92ad1@codeaurora.org>
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
 <20200603001724.12161-3-pradeepc@codeaurora.org>
 <a5cac45b02396c98628738cef7f92ad1@codeaurora.org>
Message-ID: <e08a20b99363d68626bc38b6e3d2fcfd@codeaurora.org>
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

On 2020-09-15 19:16, Wen Gong wrote:
> On 2020-06-03 08:17, Pradeep Kumar Chitrapu wrote:
>> This patch adds 6GHz band support and mac80211 registration for
>> the 6G phy radio.
>> 
>> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
>> ---
>> v5:
>>  - do not add ht/vht caps in 6ghz band.
>> v3:
>>  - update 6GHz starting frequency as defined in IEEE P802.11ax/D6.1
>> 
>>  drivers/net/wireless/ath/ath11k/core.h |  6 +-
>>  drivers/net/wireless/ath/ath11k/mac.c  | 93 
>> +++++++++++++++++++++-----
>>  drivers/net/wireless/ath/ath11k/wmi.c  | 16 ++++-
>>  3 files changed, 94 insertions(+), 21 deletions(-)
>> 
> [...]
>> @@ -3482,7 +3494,7 @@ static void ath11k_mac_setup_ht_vht_cap(struct 
>> ath11k *ar,
>>  						    rate_cap_rx_chainmask);
>>  	}
>> 
>> -	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
>> +	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP && 
>> !ar->supports_6ghz) {
>>  		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
>>  		ht_cap = cap->band[NL80211_BAND_5GHZ].ht_cap_info;
>>  		if (ht_cap_info)
> After this change, when 6G is support, it removed HT/VHT of 5G band
> from "iw list", when connect to an 11AX AP of 5G, it used non-HT.
> caused together with this commit
> 75e296e9b22aef6fa467523ace87ef623dac1fad(mac80211: simplify and
> improve HT/VHT/HE disable code)
> +       /* disable HT/VHT/HE if we don't support them */
> +       if (!sband->ht_cap.ht_supported) {
> +               ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
> +               ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
> +               ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> +       }
> 
> after remove this change in ath11k, it become correct to HE
> iw wls1 station dump:
> rx bitrate:     149.7 MBit/s HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
> 
Hi Pradeep Kumar Chitrapu,
For QCA6390, it is single_pdev, the pdev support all 2G/5G/6G,
Is it have 3 pdev/ath11k in your chip for 2G/5G/6G?
And the pdev/ath11k of 6G have WMI_HOST_WLAN_5G_CAP of 
cap->supported_bands?
> [...]

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

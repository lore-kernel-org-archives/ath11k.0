Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtfM-0007cN-QZ
 for ath11k@lists.infradead.org; Tue, 20 Oct 2020 15:35:18 +0000
MIME-Version: 1.0
Date: Tue, 20 Oct 2020 08:34:52 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH 1/4] mac80211: save HE oper info in BSS config for mesh
In-Reply-To: <cc254230-5909-b77a-8c13-2c769a618660@eero.com>
References: <20201009021811.18584-1-pradeepc@codeaurora.org>
 <20201009021811.18584-2-pradeepc@codeaurora.org>
 <cc254230-5909-b77a-8c13-2c769a618660@eero.com>
Message-ID: <a08d1aae3c4359f736f25053c3075afd@codeaurora.org>
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
To: Peter Oh <peter.oh@eero.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


>> +	if (ieee80211_get_he_iftype_cap(sband, NL80211_IFTYPE_MESH_POINT) &&
>> +	    !(sdata->vif.bss_conf.chandef.width == 
>> NL80211_CHAN_WIDTH_20_NOHT ||
>> +	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_5 ||
>> +	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_10))
>> +		return;
> 
> Are you update BSS only for sub-20Mhz?
> 
> Shouldn't you remove "!" for 20~160Mhz?
> 
> 
> Thanks,
> 
> Peter
Thanks Peter for the review..Might have been a typo and I missed it..
I will fix this and submit next revision.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

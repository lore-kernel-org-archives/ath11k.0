Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2AEC54EBD
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAVl06Ke7cO50Qkr6Am710LCSxEURHXdSCb5SEyhnto=; b=VgxA/EvTIt2dfz
	8NEhfTHlufDoTGi1qnefbTwWb703wN2k5q/wFo1P7Sx6rCDLcMS+YbnWtWPtLxUuvHUpErB3fUi+v
	fgJQKDFDNFjiifNTZbpYbX1Z3RB1Z7nj3yogZH5a1czsuDy1ca4ExFAe/Wjku1WMDYgtCmvv6hs/+
	tRV1ilnQNCAtfB3wvZXl2x1xdL/+i0Q94Ubb13RwpLipDFEMUbIrCR9Ld6rtJe6bqQh+UujU1FMfN
	LAFVziw2/+gLkRxqacfP/yIpwuOWrQqTklBeeYkjnF8dLoeiZzEWNsRV5grmvZ8kaZmETAjLeXGUq
	FVYRmTriSNVFS34YDF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEt18-001uZB-TQ; Mon, 09 Jan 2023 14:20:50 +0000
Received: from ns2.wdyn.eu ([5.252.227.236])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsmq-001oQF-T0
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 14:06:09 +0000
Message-ID: <d28c6340-7ad2-d7f6-939d-3a1a057cb7da@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1673273151;
	bh=4NGAakIbuen1X1A4D+gVp+ybsFKBfg8XIHb2/10NUww=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=j8RoYYRllBwdlALKhSb21I4ts4c6WMArTKpJeLwVpAFwngnCHqvoOt+uqYbqNIbmi
	 4JFHGCcbtgre5wVSwZCvRlpakyoleZacPRxJpF6bg0OktJ4nuPSNa5/lkfgmFqJX6X
	 mc1JDQfTBa5yukN6AYhy5iyY1NEQEMtZ+klOmmNI=
Date: Mon, 9 Jan 2023 15:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Alexander Wetzel <alexander@wetzel-home.de>
Subject: Re: [PATCH] wifi: mac80211: change initialize for sk_buff in
 ieee80211_tx_dequeue()
To: Guenter Roeck <linux@roeck-us.net>, Wen Gong <quic_wgong@quicinc.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20221212083607.21536-1-quic_wgong@quicinc.com>
 <20230105052647.GA2477583@roeck-us.net>
Content-Language: en-US
In-Reply-To: <20230105052647.GA2477583@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_060605_620929_81A852A5 
X-CRM114-Status: GOOD (  18.01  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 05.01.23 06:26, Guenter Roeck wrote:
> On Mon, Dec 12, 2022 at 03:36:07AM -0500, Wen Gong wrote:
>> The sk_buff is only set to NULL when initialize, sometimes it will goto
>> label "begin" after ieee80211_free_txskb(), then it points to a sk_buff
>> which is already freed. If it run into the "goto out" after arrived to
>> label "begin", then it will return a sk_buff which is freed, it is a
>> risk for use-after-free.
>>
>> Fixes: ded4698b58cb ("mac80211: run late dequeue late tx handlers without holding fq->lock")
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> 
> I don't see any progress on this patch. Is there a problem with it ?
> Did it get lost ?
> 

Looks ok for me. But I just noticed that my patch
https://patchwork.kernel.org/project/linux-wireless/patch/20221230121850.218810-1-alexander@wetzel-home.de/

should also fix the issue as an unintended side effect.

Alexander

> Thanks,
> Guenter
> 
>> ---
>>   net/mac80211/tx.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>>
>> base-commit: 922932ca02191a390f7f52fb6e21c44b50e14025
>>
>> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
>> index 2171cd1ca807..0b23cc9ab9c7 100644
>> --- a/net/mac80211/tx.c
>> +++ b/net/mac80211/tx.c
>> @@ -3776,7 +3776,7 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
>>   	struct ieee80211_local *local = hw_to_local(hw);
>>   	struct txq_info *txqi = container_of(txq, struct txq_info, txq);
>>   	struct ieee80211_hdr *hdr;
>> -	struct sk_buff *skb = NULL;
>> +	struct sk_buff *skb;
>>   	struct fq *fq = &local->fq;
>>   	struct fq_tin *tin = &txqi->tin;
>>   	struct ieee80211_tx_info *info;
>> @@ -3790,6 +3790,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
>>   		return NULL;
>>   
>>   begin:
>> +	skb = NULL;
>> +
>>   	spin_lock_bh(&fq->lock);
>>   
>>   	if (test_bit(IEEE80211_TXQ_STOP, &txqi->flags) ||


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

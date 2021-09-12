Return-Path: <SRS0=7g+G=OC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C814C433F5
	for <ath11k@archiver.kernel.org>; Sun, 12 Sep 2021 19:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A7061051
	for <ath11k@archiver.kernel.org>; Sun, 12 Sep 2021 19:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32A7061051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k+Z9SHITi639ybYXzfV+F305Ed01RG/tzMQXavd+62M=; b=T43oKxyyqqOHY5yUk+9BiVKN2/
	JaOWu1B3oYCKmbUqZkKcgtKB3I6vyApkjTgYun4debqYvNllfxvvnuSc0TKXwf1BkbEKDw6+FBvJY
	A578kPVnoqxu7G55KjMtrmG096vvrKq2oyPka5oCk5vobIzBUrnErqygkp6k0AknOWq1EEssxJSpF
	u7YvE0s9gjzRv2vYTWYkzhcBO5S/GQyJuEivBAoWxlRwVvSX631Nq3nVORdkn45FSHxPwOM27XiGH
	o3DOUnTpr6X6QEVeSf72YQQZaGz5D7I/WKcO9t4ci/kdR1C+zGlLAum3HfGeDubCJ16+AZEMDoiGZ
	LNZy3CWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVKD-00H3ob-O6; Sun, 12 Sep 2021 19:39:37 +0000
Received: from gateway24.websitewelcome.com ([192.185.51.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVKA-00H3mA-Oq
 for ath11k@lists.infradead.org; Sun, 12 Sep 2021 19:39:36 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id BF30F6745
 for <ath11k@lists.infradead.org>; Sun, 12 Sep 2021 14:39:03 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id PVJfmKe1AMGeEPVJfmQb26; Sun, 12 Sep 2021 14:39:03 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKDQOkt6TxsQsetnoiDEY3nKbPSKGF4Zl9dUo5Mi4w4=; b=nh/NrY6N0h/ZYNN5wLYNvFPOwe
 SNOaz+OgddxQ4fy7OD5EelQD2K5zPLTNMeJbHpNvHjzGKXwwtSEh5vBEo6W266p7FI8rYP0/LSU7K
 vHJvPkU0QYuEnOgDOU2WaSuCgnruI+/1mdg8gAjv1/xRIcHxQgz4ke7niwCeGmVenWBwVGcZfCFRb
 zPcS3AmwpWCG2642FS8OylNM6xs8mMcyv79O4BKzsELZdujqO6hhyyfIYzFxShW9ipj6kmZvvajbV
 J2Sxd9xTC5alM5stuGa7QOf6J9cuQTMZ/SCc4YReytU9FllgYKhnmsPVbxHmbu6N7Rzly325EcgHc
 prPk/OFw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:57030
 helo=[192.168.15.9])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1mPVJd-003oAk-Ox; Sun, 12 Sep 2021 14:39:01 -0500
Subject: Re: [PATCH] ath11k: Replace one-element array with flexible-array
 member
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Len Baker <len.baker@gmx.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210904114937.6644-1-len.baker@gmx.com>
 <20210912193140.GC146608@embeddedor>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <7a9ba7d3-b5e7-00ab-3bd3-7fca476aae94@embeddedor.com>
Date: Sun, 12 Sep 2021 14:42:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912193140.GC146608@embeddedor>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mPVJd-003oAk-Ox
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.9])
 [187.162.31.110]:57030
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_123934_968270_24D62E14 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 9/12/21 14:31, Gustavo A. R. Silva wrote:
> 
> There is already a patch for this:
> 
> https://lore.kernel.org/lkml/20210823172159.GA25800@embeddedor/
> 
> which I will now add to my -next tree.

Well, in this case I think it's much better if Kalle can take it. :)

--
Gustavo
> On Sat, Sep 04, 2021 at 01:49:37PM +0200, Len Baker wrote:
>> There is a regular need in the kernel to provide a way to declare having
>> a dynamically sized set of trailing elements in a structure. Kernel code
>> should always use "flexible array members"[1] for these cases. The older
>> style of one-element or zero-length arrays should no longer be used[2].
>>
>> Also, refactor the code a bit to make use of the struct_size() helper in
>> kzalloc().
>>
>> [1] https://en.wikipedia.org/wiki/Flexible_array_member
>> [2] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#zero-length-and-one-element-arrays
>>
>> Signed-off-by: Len Baker <len.baker@gmx.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/reg.c | 7 ++-----
>>  drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
>>  2 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
>> index e1a1df169034..c83d265185f1 100644
>> --- a/drivers/net/wireless/ath/ath11k/reg.c
>> +++ b/drivers/net/wireless/ath/ath11k/reg.c
>> @@ -97,7 +97,6 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
>>  	struct channel_param *ch;
>>  	enum nl80211_band band;
>>  	int num_channels = 0;
>> -	int params_len;
>>  	int i, ret;
>>
>>  	bands = hw->wiphy->bands;
>> @@ -117,10 +116,8 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
>>  	if (WARN_ON(!num_channels))
>>  		return -EINVAL;
>>
>> -	params_len = sizeof(struct scan_chan_list_params) +
>> -			num_channels * sizeof(struct channel_param);
>> -	params = kzalloc(params_len, GFP_KERNEL);
>> -
>> +	params = kzalloc(struct_size(params, ch_param, num_channels),
>> +			 GFP_KERNEL);
>>  	if (!params)
>>  		return -ENOMEM;
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
>> index d35c47e0b19d..d9c83726f65d 100644
>> --- a/drivers/net/wireless/ath/ath11k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
>> @@ -3608,7 +3608,7 @@ struct wmi_stop_scan_cmd {
>>  struct scan_chan_list_params {
>>  	u32 pdev_id;
>>  	u16 nallchans;
>> -	struct channel_param ch_param[1];
>> +	struct channel_param ch_param[];
>>  };
>>
>>  struct wmi_scan_chan_list_cmd {
>> --
>> 2.25.1
>>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

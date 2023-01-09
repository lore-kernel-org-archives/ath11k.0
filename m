Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42859C54EBD
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsxQZ9rFAfpQF09nZM3fERbsBQKR9dO/+YS3xKE79MI=; b=Kvfo0e9UOjCLoE
	ZVXXs0lApyd6pBYRt8s9GXdVtAfTysEJFKs15b2HrAgEG8QdlN5JZXh+bVYrpbiLQaWMlHzzDecnG
	EeNrPfMinqEWVtfOmn5Z6ydimDdsF0nFZPFGfD6zeegEVHlyaHpE2dXD55xDFVV8BgHbVpP0ApfXx
	BDKtZKXfOx3Oy3tK510GgBvESjJ8Oht7sN3QlXTSjl2r9n+9MD17AiD2OO8UGkxDEQUVcbfGs5KGG
	6YsnALVWsEF6WuJO5rCpkcWYgCaTs7vYiwm6edDmdJ7ZnjhMg+uscaHQ3PlhowbGaUDXYqIFz342W
	+iwIEngIEWkghWA1+5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuJ4-002Mc0-Mf; Mon, 09 Jan 2023 15:43:26 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuIy-002MYG-Ga
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 15:43:22 +0000
Received: by mail-ot1-x32e.google.com with SMTP id j16-20020a056830271000b0067202045ee9so5364360otu.7
        for <ath11k@lists.infradead.org>; Mon, 09 Jan 2023 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dk0DIf3m8mAbPrZmJ7FA4rKsFWKveZQh5DZJPWwG10Q=;
        b=IvAS/2RRpoD6HLWNsjz2sTSejxq0r/thJ5+JV6cxos4fYHyqvgXt0BFuKhqKfSygXc
         ik2SkgMH/+LSCEid9NlwBm0vxzOI/fQOPay0w7H4Qq+xAgVPU6GFOr8evqemOAgFB/hv
         gR+jzFOpNifkTCpMqjdzcgqVynYm97YzCwuSgLpHldHNsa2fipVWyOyNg0MAxLYnMu7i
         ipqDnrkkPIwGbP6MF593t/G52b/CmuQbQjYRFC4r2nScENsvbv6Mn3EYCjwcztejKOCU
         BfrzFCvn5kp3dyKsRFa5g1R+OH1o9L4PztArVj+W68Jyo29AMRag4MPpeOuPZNwJk/IY
         lvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk0DIf3m8mAbPrZmJ7FA4rKsFWKveZQh5DZJPWwG10Q=;
        b=nrKpR7LYPNlxe9sipbP0qOvYZX+GezSFPxvtTsp/NEux+5SF/yJGsOCbFBRUINFY15
         LDnNPXoVWaWpC+nWp0K2uzFbKNxlkVoHCz4FIH3sRfzb5aQgpzoSBmZ9m4YblfdFP9gK
         9kB2r6BHDuC3CSBA7uQCwZWWUpiOg+zH2tv5Zh7jT3iWwI2NfZ2lOj4FgLkz+IXhzKIb
         slGGAw+zwAAQGmWrv3bTifOdzN7l+B7jsF85yBjdmzRhqI/xE/ExaaS4rlg8CsfhS4tr
         jNmboIavwxPrRb6OL/gMaXQOF5Qdy3p6G+bUJarllOG8Y5Kep9WUd1k/JvHAWlbT18EV
         X6GQ==
X-Gm-Message-State: AFqh2kpLjxQ9/e+cBwWaLvUUVlxahO23KXLA59vFLTBQCowBeAtjckAm
	DKGOmeuKDTkjeTc13ygCruU=
X-Google-Smtp-Source: AMrXdXsCo9IbAIuhu0R12wYIv4CfWGyRJgXt+ImyWl7YfAeRdnCTZZcHIHRqdD9kJ0JuUJUfuWezpg==
X-Received: by 2002:a9d:674c:0:b0:66e:6d33:fb32 with SMTP id w12-20020a9d674c000000b0066e6d33fb32mr29729864otm.26.1673278997558;
        Mon, 09 Jan 2023 07:43:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e18-20020a9d6e12000000b006849b445543sm159134otr.18.2023.01.09.07.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 07:43:17 -0800 (PST)
Message-ID: <065cf0e5-2c64-56c6-ee66-a6b61be2dddf@roeck-us.net>
Date: Mon, 9 Jan 2023 07:43:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] wifi: mac80211: change initialize for sk_buff in
 ieee80211_tx_dequeue()
Content-Language: en-US
To: Alexander Wetzel <alexander@wetzel-home.de>,
 Wen Gong <quic_wgong@quicinc.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20221212083607.21536-1-quic_wgong@quicinc.com>
 <20230105052647.GA2477583@roeck-us.net>
 <d28c6340-7ad2-d7f6-939d-3a1a057cb7da@wetzel-home.de>
 <3372b42f-b9bf-20e8-35f9-5370571a9e35@wetzel-home.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <3372b42f-b9bf-20e8-35f9-5370571a9e35@wetzel-home.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_074320_620599_04F18BD9 
X-CRM114-Status: GOOD (  14.98  )
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

On 1/9/23 06:22, Alexander Wetzel wrote:
> On 09.01.23 15:05, Alexander Wetzel wrote:
>> On 05.01.23 06:26, Guenter Roeck wrote:
>>> On Mon, Dec 12, 2022 at 03:36:07AM -0500, Wen Gong wrote:
>>>> The sk_buff is only set to NULL when initialize, sometimes it will goto
>>>> label "begin" after ieee80211_free_txskb(), then it points to a sk_buff
>>>> which is already freed. If it run into the "goto out" after arrived to
>>>> label "begin", then it will return a sk_buff which is freed, it is a
>>>> risk for use-after-free.
>>>>
>>>> Fixes: ded4698b58cb ("mac80211: run late dequeue late tx handlers without holding fq->lock")
>>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>>
>>> I don't see any progress on this patch. Is there a problem with it ?
>>> Did it get lost ?
>>>
>>
>> Looks ok for me. But I just noticed that my patch
>> https://patchwork.kernel.org/project/linux-wireless/patch/20221230121850.218810-1-alexander@wetzel-home.de/
>>
>> should also fix the issue as an unintended side effect.
> 
> Sorry that statement was incomplete: It's only fixed when
> https://patchwork.kernel.org/project/linux-wireless/patch/20221230121850.218810-1-alexander@wetzel-home.de/
> and
> https://patchwork.kernel.org/project/linux-wireless/patch/20230106223141.98696-1-alexander@wetzel-home.de/
> 
> are applied.
> 

Ah, yes. That is indeed correct. Let's just hope those patches will apply (and are
going to be applied) to stable releases since this is a real problem there which
does cause UAF and crashes.

Guenter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

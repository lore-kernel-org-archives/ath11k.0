Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEC9C433F5
	for <ath11k@archiver.kernel.org>; Sun, 24 Apr 2022 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFIvlSF8/1Gjo+g+AWmy8PZqsQbHrgbOQgwhvgaXg88=; b=OjBrq7Bhf+uV5R
	JtShf4shjRVCkz0lZvfZPnlcMzSog8wCfWcRdT3PSbc4ae4NkeLfdxkpI6wlf/amXVSA4FDqT5Jrz
	uYh3fwkvsTeL2ja7oeyWd4pT7PAEJTy0k09Gi/Z6gocCkVp2Y9xuXKxH90nFqrBRaX/k2aiFRMtkn
	2/MbHbASo0LyfWL0oqzmxNNIm1IDLpvhrT/e2LXuduNKEHFZcZiTRPAtQPrNE41iwYeUga9CE+GTo
	3tnwGLhryFQ2vvKxJjuGG+4xHejPMHk0ybBgfDutBYU4nlSdGhB/kunQGXvx0kUQKl8tjDOBH089Q
	eI/YVrcMtNfVBt2DIByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niZRi-006Lg5-I2; Sun, 24 Apr 2022 10:26:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niZRR-006Les-So
 for ath11k@lists.infradead.org; Sun, 24 Apr 2022 10:26:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1605B80E06;
 Sun, 24 Apr 2022 10:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FEBC385A7;
 Sun, 24 Apr 2022 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650795965;
 bh=JWVZ39Sx4mRPxwSMcZ085+th6rdL6JTEmOQlC+K+Wkw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VoCmgW0EQo2ZldDwXZ6vnNtOuMMgPvibp7qzA0yPUTv5YsPtZ/rq39hZd+2gYhyKN
 1beVhQfpudjgMt7V3TB4rJCkcN+xIRuELfgFAhxuQ+E7fWFwTkT0C/hQ0juRt69+lE
 x0wSiSAq1WCtB++6zWYvJFa055zntJWBoxy3zZfh/Ze+pJnPZqG+yvvcvxFKhz9cgg
 CrdDQMzSZJb9iqJjJkiF3Gsx1qAmK2+GR9Cmjs9C7XugoDiu3ExgkmEqvVx73jsv4C
 GPJb3JkLcInMhpZgiGjxGTJmD7JwJosiuCaBocO/K+HKG9Y6mY+yzxB/XLJtxSxr46
 0Gufdnbv1F+3w==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: add read country code from SMBIOS for
 WCN6855/QCA6390
In-Reply-To: <61d2a5aa-c82d-6994-a8f3-0d31e32421be@quicinc.com> (Wen Gong's
 message of "Sun, 24 Apr 2022 14:22:56 +0800")
References: <20220421023501.32167-1-quic_wgong@quicinc.com>
 <8735i4m8hu.fsf@kernel.org>
 <61d2a5aa-c82d-6994-a8f3-0d31e32421be@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Sun, 24 Apr 2022 13:26:01 +0300
Message-ID: <87o80qkcau.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_032610_116592_A54197DE 
X-CRM114-Status: GOOD (  11.91  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 4/23/2022 5:53 PM, Kalle Valo wrote:
>> Wen Gong <quic_wgong@quicinc.com> writes:
>>
>>
> ...
>>> +
>>>   struct ath11k_smbios_bdf {
>>>   	struct dmi_header hdr;
>>> -	u32 padding;
>>> +	u8 features_disabled;
>>> +	/* enum ath11k_smbios_cc_type */
>>> +	u8 country_code_flag;
>>> +	/* To set specific country, you need to set country code
>>> +	 * flag=ATH11K_SMBIOS_CC_ISO first, then if country is United States, then country
>>> +	 * code value = 0x5553 ("US",'U' = 0x55, 'S'= 0x53), To set country
>>> +	 * to INDONESIA, then country code value = 0x4944 ("IN", 'I'=0x49, 'D'=0x44).
>>> +	 * If country code flag = ATH11K_SMBIOS_CC_WW, then you can use
>>> +	 * worldwide regulatory setting.
>>> +	 */
>>> +	__le16 cc_code;
>>>   	u8 bdf_enabled;
>>>   	u8 bdf_ext[];
>>> -};
>>> +} __packed;
>> Is cc_code really in little endian? I would expect data in smbios to be
>> in native endian (ie. u16), bios using different endian than the host
>> sounds strange to me. And struct dmi_header also uses native endian:
>>
>> struct dmi_header {
>> 	u8 type;
>> 	u8 length;
>> 	u16 handle;
>> } __packed;
>
> Yes, Kalle,
>
> I agree with you.
>
> need I send new version to change the "__le16 cc_code" to "u16 cc_code"?

I fixed this in the pending branch, compile tested only. Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a6d583e310c70fb93ec7045f0ea38c12632098d8

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

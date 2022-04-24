Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B5EC433F5
	for <ath11k@archiver.kernel.org>; Sun, 24 Apr 2022 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNJPxOJqzvyr0vyzwsmcE9h+k5TDHeNGlvbg7zLndd0=; b=imAh7/fsDYzv1n
	QlDaGNO86twNa18sYTxui21Z+hkva0RO4pmEGTrV2RxD8wWGXTSWTTHUozGdc79Pf3Xyy1vaZBGZ9
	XKAObgEv+u7ifthdA3gpr6dZF+qb5EGx0kZUxFN7+xvW9slkvk5tpZaztv+FoCLMCVPWQz6Knr3ww
	M+qnk2I3ehYbrZEE+HnEoOOad5lICXkY6bHy+uvonh0Qhh051d1PRNSEm2Pmc3c4Q3zYWhGQRp2mU
	jg+g2qAk1uPtE8jO+FWVzBpzc4MMjfT2/ui2/XIh8RMlOgjKl4O/4omdp83s6cGQwStWIQqZFI93j
	nZmi8+DuNLwGpoxvZWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niVeG-005xHa-Cx; Sun, 24 Apr 2022 06:23:08 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niVeD-005xHG-TB
 for ath11k@lists.infradead.org; Sun, 24 Apr 2022 06:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650781385; x=1682317385;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kKPFsit4rUYK7gNNds11XB+VuG/GjGDkpievrmyAjw8=;
 b=E5/yExGP9eY49/QaU0wl8GnWUCyDjSCiuJiLGSRYpc9EVEQ+nlnfwLNI
 prJ67HrnrbTK73Q7G/CQviMyE1jxcqoc9nOtubmvS8ULNnBlSVvsWLsYA
 AO+L2N37IORa42LC+2pfHVZvWMpP/xQCBylgDY+wt/plcNJhs/KTrcZeA 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Apr 2022 23:23:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2022 23:23:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 23 Apr 2022 23:23:00 -0700
Received: from [10.253.9.110] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 23 Apr
 2022 23:22:59 -0700
Message-ID: <61d2a5aa-c82d-6994-a8f3-0d31e32421be@quicinc.com>
Date: Sun, 24 Apr 2022 14:22:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ath11k: add read country code from SMBIOS for
 WCN6855/QCA6390
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220421023501.32167-1-quic_wgong@quicinc.com>
 <8735i4m8hu.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <8735i4m8hu.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_232306_022044_82760A80 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

On 4/23/2022 5:53 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>
...
>> +
>>   struct ath11k_smbios_bdf {
>>   	struct dmi_header hdr;
>> -	u32 padding;
>> +	u8 features_disabled;
>> +	/* enum ath11k_smbios_cc_type */
>> +	u8 country_code_flag;
>> +	/* To set specific country, you need to set country code
>> +	 * flag=ATH11K_SMBIOS_CC_ISO first, then if country is United States, then country
>> +	 * code value = 0x5553 ("US",'U' = 0x55, 'S'= 0x53), To set country
>> +	 * to INDONESIA, then country code value = 0x4944 ("IN", 'I'=0x49, 'D'=0x44).
>> +	 * If country code flag = ATH11K_SMBIOS_CC_WW, then you can use
>> +	 * worldwide regulatory setting.
>> +	 */
>> +	__le16 cc_code;
>>   	u8 bdf_enabled;
>>   	u8 bdf_ext[];
>> -};
>> +} __packed;
> Is cc_code really in little endian? I would expect data in smbios to be
> in native endian (ie. u16), bios using different endian than the host
> sounds strange to me. And struct dmi_header also uses native endian:
>
> struct dmi_header {
> 	u8 type;
> 	u8 length;
> 	u16 handle;
> } __packed;

Yes, Kalle,

I agree with you.

need I send new version to change the "__le16 cc_code" to "u16 cc_code"?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

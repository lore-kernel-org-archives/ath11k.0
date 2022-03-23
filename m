Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01435C433EF
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ycw00SfRFraBPh2dP6nu+vEBUQrdeOSUUWbsFhgP1Fg=; b=Jyc4+RGWO2fLzj
	OPv6PRR27zY0Zdh9iC8RSqPbY5Yw1vt10CS+1DiLZ7091CYXMoPDCR4BHD4sZgJyxgtiBwgX+/RAo
	D1pNOZsus/+vsaqsCEVAfXLNr0w91vKYZdSlTCKs9wc18o060SMJO2kJsesB5zjZmn8GsM0tj5zl5
	dMfOPt239jy9gBx1VHIFKafIV8DK6DvqHOdhzbrT15DxCPFWMU4y/+b7hKF1oPN4PED8CXydx+EXe
	hq0dkLvvrriku4KcjdQEeeXUvFNItqOvPW3AsYhlKD/5poshQTmdPa0KjrZ7mzn5bYzbtoMsnOfrf
	OIFvfIWAdYyu8CB5VM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwjo-00D9ui-0V; Wed, 23 Mar 2022 08:53:04 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwjl-00D9u4-Vd
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 08:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648025581; x=1679561581;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sDeRRsmRpuViwjigGYPiNv2eAp0jI1SP6C9suZ9+Qik=;
 b=av3TIrZUuKYz6AlT0xaq9d8Fy/6VmOn2c1hvPySLlIXawKTC/U4rj4Pn
 BTiOY2fp/eGL5tlv8zmeY41pjogIXEkKRsOyS1fOvqgBjamflT1kr1ru0
 oDemN5VdCMEbmFB1GEJpbWWpQJZTj3dL0HGevah6L8VuLerbGN8SJoPp5 Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 01:52:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:52:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 01:52:47 -0700
Received: from [10.253.72.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 01:52:46 -0700
Message-ID: <1c4230e0-f01e-0db1-af95-65aa2d3ac508@quicinc.com>
Date: Wed, 23 Mar 2022 16:52:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 2/2] ath11k: add read variant from SMBIOS for download
 board data
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220315104721.26649-1-quic_wgong@quicinc.com>
 <20220315104721.26649-3-quic_wgong@quicinc.com> <87r16tkqbx.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87r16tkqbx.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_015302_103632_2B7DEF63 
X-CRM114-Status: UNSURE (   7.44  )
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

On 3/23/2022 4:47 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> This is to read variant from SMBIOS such as read from DT, the variant
>> string will be used to one part of string which used to search board
>> data from board-2.bin.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> [...]
>
>> +struct ath11k_smbios_bdf {
>> +	struct dmi_header hdr;
>> +	u32 padding;
>> +	u8 bdf_enabled;
>> +	u8 bdf_ext[1];
>> +};
> I was about to commit this but noticed bdf_ext[1], is there a reason for
> that? Use of [1] in arrays is deprecated nowadays:

Kalle,

no reason for it, please change bdf_ext[1] to bdf_ext[0] or bdf_ext[]. 
It will also work well.

thanks.

>
> https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

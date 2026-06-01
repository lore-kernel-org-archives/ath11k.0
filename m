Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF32CD6E55
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6FNzWGs4Z8LyHUZwseIEFziLsC8jN2t9jRwmXdWlBc=; b=r6PCy0DFzxgs4btHbkczmhWzO6
	FVLKXSRafKKjaJ+GPWeO0h3QBhNlxt8ktdjtwYl2pxLT65NFg4mG52FrARYlQyuFtowPvr0d7RLzw
	4m1mgIr1i9expFRi3HS4BY6MMjok8Lvupfw2LJThnB9nvIt9YkDCLHmwdchdv8TUHmmtYuA+273TM
	BHhdimaLIlq+L/1XtlIK2XTjxEP0WOnfJQCfyXCOiOssawgDNKXN7re7b57fZNiNfaidERnwziW5j
	DHjSzxk6YBQfTGkK1z4qJqWRcyUS0z4aU6JH/nUyPgZNLE6KZ1SSTyPiUt5SLjd7ZdpgH9a7Mx06p
	Ysufi3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4wd-0000000BPjf-1zj4;
	Mon, 01 Jun 2026 15:52:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4wb-0000000BPjG-3Nr5
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 15:52:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EfxbE1214208
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 15:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6FNzWGs4Z8LyHUZwseIEFziLsC8jN2t9jRwmXdWlBc=; b=auEqehJE5iU8qMIB
	4iQ+eya2g6UuqIuXhl3jot8nkvpMgZ13Lpg9dU5hAbiYtLgDCzfIml/ib5hzlX2X
	5o0CxP1llqOO4LmBrSMVsjCLhv1yxuFlUDxXpWPMx3rSUVJIwte4eP4w5rz3yP3e
	YqY3Oa7tFxvXXcU+xNcxdAYzQt05mA8Va3tOA7IgKK1PzFhFKuQ8V75xTzLRT8ja
	CHCPnwLNaM/NlQoW+N1K6n2PWbif3/cblJsCWkXPQVKpWXVvMPb7vK3lJBKDoDmm
	2LzUEPTrglE81TvrqYrq9bclw8l42MSqu40IwZR9zY9itCa/jumjAiJAs11Wk4A2
	6H0HHQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s99sxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 15:52:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2f19558so949354a12.2
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780329168; x=1780933968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6FNzWGs4Z8LyHUZwseIEFziLsC8jN2t9jRwmXdWlBc=;
        b=UjyVrnivAXYWTTmbUezAw8xOobIuws0GybtojNdOkp7bVIacMaiHFChHbe2Wsnh8pv
         EKCveOx7+IF9g2inNlQGLp92wEYmxT9SM6rTpTEpFvtUgcHXeBitux2x+CrTCPWjAAfA
         wC3Dsp83wrgRTiMohMBO8bHNKrqcw8TN72xjElLpRiIKaRqr9Vokskz2X85JzBT18Pvn
         kucuClkE+IIEocruwL4Pir4Nj2IdlJMpy9OSCqfqvu1gSccvhAPTmdHhJ5TUMQvZL1V+
         97hDpfq51sO9h6Bf5qJ3BjY9N5flc6R5j86mS9/hvUq0vOPcYwfZrKl5dwOp3bkvF/nF
         GVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329168; x=1780933968;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6FNzWGs4Z8LyHUZwseIEFziLsC8jN2t9jRwmXdWlBc=;
        b=qM9BA6kbLBAj55PDtccKqci8PkGnwD2wTjUGC545w7mA8CudXNVHn5yTQIlYPoZpV4
         cSS77S2SGcwvGCJJdj+4UNe++INMSJTktUettYY+rHIqDHC1/y0lzYyUhMM/m8Vtj9YG
         NwQCO+IlMjXvvADcuC9bQC/K4ir38qHLH6B6l9BQf2k0auaznxcD7aIAT+A7OdrlD2b3
         2ClPUyLsaTdSQdEyKiH/vRkX+2t2aZPfLAAhxVeH+FU6MpgCCbZ3hxIpNGG19sFHVO5n
         20b+buyfgWi2FSwmfGeT1j0INf0atdiHCtrRLYUntgSl0h6ZyazF2Rab/ariGWM++X32
         PpUw==
X-Gm-Message-State: AOJu0Yx7CLNtnl1o3ChypZA7bMUgOZRbI2hCWD0NmKgKEp0Iej/QOk6g
	BOCAvXLp71gz6KjiI1YK6uJUbNu+vDGCWYdi2W0159bw1eWsBVPpXiLMp9xDWyAK5J6NpsqabnU
	pu8sT5Zkyx+dZEsIjG9nZmzZ85+1E2W1G+pLoOWY5Q79un2m5ZOoS1lokPXP5a2AxylIeDz//
X-Gm-Gg: Acq92OFMgSFfhANWPgPfP57PlUW0LYXB+trRxD8sh/kvpVaoj/rAe3Il8Nm64+WtVtW
	Y+50NYlA8h38l1tBExtN/3JmJLtKbBtqpZzJEWo36oclNVrcuJccb8T0zIl4UpuPmR8vOlfwX4d
	I99+d8H+5bxmpwCHJF/amf8RMgc9MpM9d4kM6UjmGMTV6lALrFHKC3FkNkXugMibtUEwdkGq5FD
	HRsWKiragcHNqAHxvPtvhgD5DWbvGc0baM1REtTGA2Ei1/GrSyNjI1QORPjX2zXcejsCe6N4Xmn
	BgbN5WpX13f+zOL1nclnqYW3uBZx92H9vYKKhkoTmwVLl2ygO0FNFThy+DIPXY85aetQu0+MBEl
	LzQ7FaT7adzYq8K5nOqDorvg+0o9Zh/iCAaBCjHCCyC7lE/hfbgERv2a3vimexxTAogWrMtQ0B9
	ZO
X-Received: by 2002:a05:6a00:12e1:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-8422535b96bmr10349460b3a.11.1780329168316;
        Mon, 01 Jun 2026 08:52:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e1:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-8422535b96bmr10349436b3a.11.1780329167784;
        Mon, 01 Jun 2026 08:52:47 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce9cebsm10503378b3a.52.2026.06.01.08.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 08:52:47 -0700 (PDT)
Message-ID: <98eb4355-1e4a-4389-a272-1c2277554fbb@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 21:22:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: raise max vdevs to 4 on hardware
 with P2P and dual-station support
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jE9N5t6B3AGgrFjf5aWFN7GVhUNS_ops
X-Proofpoint-GUID: jE9N5t6B3AGgrFjf5aWFN7GVhUNS_ops
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1OCBTYWx0ZWRfX2oDQemN/QgWS
 erg4ri4SBJDzhK7n5z7y1k8IpMunptkMhwb3jq31js24+IpwVd/ckkAhE3OypYc02G3/GOiYajP
 0rtfvPgh7iRUd4VD8Bt4lqJKcFPS+oPUPwFTN5XaW8xaV1p+9SBu1UTTblR+Oof5UMXKl4OKrlb
 Pjtz/y//jptN93KYKUkay1Q2nDhxMWxhkJuVOZwDTjoVE2fX0i67CSI+qraEiCvNgA3d6K2uK+Q
 hi45MXrj3846pEffR0Ekjy0Go71dpStudKNyn3YEYfHMAcsPNXh1DBdxAb6o54SRHdURZLzv1S/
 EJ4HZYkyBrsI0XzDQAzD/GezCt0inzh1caH31PfyWP+HcG+VXLxu1ok0hrUtYv/rFKp5EnJ0k6L
 /3hQK4mApa2nc9vUjLxxFDKI7OlKZGS6uNktT8Ydmgk3b2cvbHxQSBvFfcIuzeVl3+HxeSLsJxB
 Q5/6DNNeblXk83tEFlg==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1daad1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DLlhXEFHjEEqyZQXiqAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_085249_885592_F8A0B6BE 
X-CRM114-Status: UNSURE (   9.73  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 5/25/2026 7:37 AM, Wei Zhang wrote:
> When P2P support is enabled, wpa_supplicant creates a p2p-device
> interface by default, which implicitly consumes one vdev. On systems
> managed by NetworkManager, this interface cannot be reliably disabled,
> leaving only two usable interfaces for user configurations.
> 
> Increase num_vdevs to four for QCA6390 hw2.0, WCN6855 hw2.0/hw2.1,
> QCA2066 hw2.1, and QCA6698AQ hw2.1 to account for the implicit
> p2p-device and enable common concurrency scenarios such as AP + AP + STA.
> 
> This change increases interface concurrency in the two-channel scenario
> by raising the maximum vdev limit, while keeping other combination rules
> unchanged.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


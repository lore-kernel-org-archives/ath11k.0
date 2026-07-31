Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC19C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBbt58it9lwrasUx+0rlFP3m0rR06R8No8JhxzBeIV8=; b=n7i+9yVQ2SvKDy200Qtk2ROYg6
	UnBixCWvcI6YPtH6FHRoVs5n6x2ia7MfQ7X2gvnGmUG6bWZBT2ULE56wz2xLukOj/qCd1XC5Zn2tD
	eRrQPF/BaDevJbEAqEcn61w9F4XF2jTa8f4zfQoQCy/MxptGbLkesSpysMvo7QJ+hmBFQ1wuy6bb1
	9qVQQhFSIP3NFjDxXNWqo2s4fN+PPAA43rnHbkcYvlemSVosCf9Rp9KT2B33wSa3mxdMEEZAYtOMz
	Y39IURp1xDhkXGvSw86klOYO2tuMapFpAxMfhXvHMmYc3vTcU3oPvhNcHEeY9ovG3Iu1zCNWQUxEu
	HIIXmOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjTb-0000000CBIW-1MMM;
	Fri, 31 Jul 2026 09:24:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjTY-0000000CBH8-1GR5
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 09:24:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8om2s3708243
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 09:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBbt58it9lwrasUx+0rlFP3m0rR06R8No8JhxzBeIV8=; b=TWXXb+iSfen26tuB
	uj2KnrebNi0K7q/BhhyODxFWBOBnF3sHx4hbpwk9l/vjl2RGPRdLk/ZWOVYwhl55
	W119NeQAhzLOzGIHU9FWJwNFNE/z5JMe+kjasnmbyf1Pra3/MYvx8Ob4iGst78tz
	UqpwcPKGlisdv98vdDJs/aiUxJW2icm7oX55j+bYq4FEGvwI0Ipf0dsyTPolSvZ6
	n1ebUKtlak9+i0b9lGWU8HWPdrMD93ldRwh9a9jZ+jfNYqt6f0BBx2/8BcUiLg1R
	CCTUI39YkjMa/K6IF2+wa87MF5CTox2I9jIr6Ae2wmTCDXAMPvisOr3odj1TrMAO
	Y3nr6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrj8r46h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 09:24:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so1029793a12.2
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785489859; x=1786094659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBbt58it9lwrasUx+0rlFP3m0rR06R8No8JhxzBeIV8=;
        b=Zny8IjhaBwJtGoymPEY8mUCMdZfGNH+5QpES9uMdUhDIzf9Oc04a6dsgFt9LPEmkIU
         yFktf9T/SG/Wgmv4V0wn3Q8xxqt0/wDids0sZVzj6jTC9v+dJswycbQkq4B8rbf4CjOL
         93cHN1MwlZSADUdXML+Ssj3iEtySyhakJ/C9/cazi2FrQCz6E3LBya+OxdBUpFak/+LB
         jVMIiig4Z1HIlLS3Xj94wsTk0F0l1W5P9YBU4CTkWCjkbxGzX6FRH7wYSboWeybw71EL
         /Wyt8xX0lLC1AvpIMb7ftLHlXa7lYmF4e3G1vSlKWrXboeGaL4qpey5CqvT9yo4YJM24
         MJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785489859; x=1786094659;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBbt58it9lwrasUx+0rlFP3m0rR06R8No8JhxzBeIV8=;
        b=ZPOm4jnT02IiP3Ie3NIMiC2CdrSZnl99ccDvKOJuSpL02fskpOiNaTwOZaD5TEcuQ5
         cdBVsMu1hSRvnYOQKRuBM9JpdUwDsW+MsIiZbZFWt4t7vuZfhmAk+X37z7TL5baf5OaU
         r0lKnWZhsfNwFOrI88KA+u232sAuZZcmFAVzdLRgT4oYwvnligJdXPc8Hb6NBIwElSvM
         xOTBYHWuD4R6We8cpbnYyDb0/gxREby6ZYbhDG873NNEe9L3ZAntpTLZ9mRX8k0vphvB
         nmUKJ79efkFZXnPK6WQkBnVOltdlQIvT3YvVtuAQr9NHDWfWiI1+VpQQ6WPENQrrhtas
         JcrQ==
X-Gm-Message-State: AOJu0YzNci5wZQDVrvYqHvwbbnuHuK1ob9RgVbXsbm6OYsD3VTmOGJkH
	YS9ziCQ4LT+gaYlb4rGKQo66DWsFmPTJso4n1RhLkDnwQvEWXlxQy0T0tXj8aCVnp8GCmRRigMM
	+VqXzU2F6bOa7lEk7DZwbxhS5ToocngNsM+gQ9e9uyGQylGrCnkEjdcrqz9Qt/eyQ
X-Gm-Gg: AR+sD13TvnjtZvnnI/u+Ff8FiX4GSbHv4vjEqVvScXX2nmBWSZsomjglFkUIyu3ssJE
	0z2L8vPcYL/ZnIgXX91qdjYmX+N+A9zJnB14z8oKeKV4pGmSlUqatQAWhw8G4t4pFoJQVE3EjgS
	jRlJgTeLJfxm/Nj52BqjgO7JI+8R2utHdPyxjNEexRhAwSsaqE9tMDjD0YrfA6CP1zUymvEkHUI
	TgYvpBj6et7KnWAQPywt+D/tsvGcAdHSeHCWDJ+63sKdnjQINI8ZSMAiCWY7saFsCWhPiGzYd/d
	C7SoMJlun0QrB09/TL6xPNgPIjOx7h7d1YUyTD90fPF9t0DzSFkGFg/MBs3ecjxGBUNQoYCIdml
	wFehTjjqBz277CqE2sfY472Nr48AklYO1H13U4NjF
X-Received: by 2002:a05:6a21:a346:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c91b267ba5mr1156594637.25.1785489859049;
        Fri, 31 Jul 2026 02:24:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:a346:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3c91b267ba5mr1156577637.25.1785489858618;
        Fri, 31 Jul 2026 02:24:18 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fe9fsm3355290eec.25.2026.07.31.02.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 02:24:18 -0700 (PDT)
Message-ID: <114b5ae4-002a-4f35-8fb1-0ebf44e9250a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:54:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH ath-current 2/3] wifi: ath11k: fix NULL dereference
 in ahb remove when QMI init incomplete
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
 <20260730030948.147892-3-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730030948.147892-3-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: icET32tlq6-q2_xpM02O7t3mUNusbxZ8
X-Proofpoint-ORIG-GUID: icET32tlq6-q2_xpM02O7t3mUNusbxZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2OCBTYWx0ZWRfX1IQVwI5snXHb
 s1ikqSdE0lnvuhYl8hkRp8nfrLkQa3XDV2/Hnd5Fh7JgU386INDs3nSPy+wwnMU6O33JzxumerT
 mIkGiMwqrOC4dNvEWt2WJeIlwNS7PUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2OCBTYWx0ZWRfX/UjFkfocYMEZ
 aD308e5Y0NUYYfypfSjnuyXaorR2fnVLGpZ5cedx6W1/+V02BhTd/nDFI9+tkDUhjDGcl7I/wUX
 BM2qJM8x9Z5Y3nxYDVyaPI0v5dBqTRLYpkg6LwuCpj/ufP1N4fqmApxs0f619frcrlo9eG2A/dw
 34uS/Mjraa1HE2eKkTU1Wqqzr+FnvnRLV7v4rRuCrYCZK32k07L36XcTVLuKAqEeE8FFBg1CVOy
 3berFTEXji0NyECU1KKpCPD4lSuvoKK0w/lcBs0FmvOM0+pre1jdSBvp7Qy6ImIu+WukTir0HM2
 riRCYiO9wKxCUq/6R+DeNEB5xcOalsQM2tNQCZ+DcFx9cyPNyPHizTOMwkQwPH43eF1gipI1qHL
 1RX71uDT83WrWc+u4YRWbXwy3Ydej9bgYXXbLVJ95DYbM9L3rSZjK5JeswEG0L1a5A++2fQKdDa
 WlPfZpRr9pIn2WZOHFQ==
X-Authority-Analysis: v=2.4 cv=dJeWXuZb c=1 sm=1 tr=0 ts=6a6c69c3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-97xbg0PSBK8MHoIRpsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_022420_349900_3354B71D 
X-CRM114-Status: GOOD (  23.19  )
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

On 7/30/2026 8:39 AM, Miaoqing Pan wrote:
> On WCN6750, if QMI messages never arrive (for example when qrtr_smd
> is not ready), WLAN initialization stops before the device is fully
> registered. In this case ATH11K_FLAG_QMI_FAIL is not set because no
> QMI event handler is executed.
> 
> When the driver is removed, ath11k_ahb_remove() still calls
> ath11k_core_deinit(), which eventually triggers
> ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
> NULL pointer dereference in ath11k_hal_srng_access_begin():
> 
>    ath11k_hal_srng_access_begin+0x14/0x68 [ath11k]
>    ath11k_ce_cleanup_pipes+0x184/0x190 [ath11k]
>    ath11k_pcic_stop+0x24/0x38 [ath11k]
>    ath11k_core_deinit+0xfc/0x1c0 [ath11k]
>    ath11k_ahb_remove+0x38/0xa0 [ath11k_ahb]
> 
> Fix this by invoking ath11k_ahb_remove_prepare() before the state
> check and skipping ath11k_core_deinit() when either QMI initialization
> failed or the device was never registered. If ATH11K_FLAG_REGISTERED
> is not set, core initialization did not complete and CE pipes may
> remain uninitialized, making ath11k_core_deinit() unsafe.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
> 
> Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/ahb.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index fb5640882b98..7f5f5c8d7c56 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1265,14 +1265,16 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
>   {
>   	struct ath11k_base *ab = platform_get_drvdata(pdev);
>   
> -	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
> +	ath11k_ahb_remove_prepare(ab);
> +
> +	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
> +	    !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {

Can we use ATH11K_FLAG_REGISTERED alone to decide the cleanup path? If 
REGISTERED is set, ath11k_core_qmi_firmware_ready() completed at least 
once and the normal ath11k_core_deinit() path should run. If QMI failed 
on recovery (say before FW_READY or INIT_DONE) this should still do 
core_deinit() isn't ?


>   		ath11k_ahb_power_down(ab, false);
>   		ath11k_debugfs_soc_destroy(ab);
>   		ath11k_qmi_deinit_service(ab);
>   		goto qmi_fail;
>   	}
>   
> -	ath11k_ahb_remove_prepare(ab);
>   	ath11k_core_deinit(ab);
>   
>   qmi_fail:



--
Ramesh


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09778606A329
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYNZF5o6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGsur7X5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmKJcaho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=; b=zYNZF5o6mUSLnz
	B8yjIgTUI1/4BBf/ruvNSY3X4D6y8/OTsNs3V16W3amo+xEzgftTmZ22EEMU4Nq63RPrK7WAdk71f
	knKLgcWmavtPIGNDE+BeL+g36qVbJNzvRl1FMpYy/FEKGCvqCzLm1oVjEp3W3N8ltu46skZ4hjEOY
	BhCGD0oQ3ku3f0Ls8lgOvkEBVJCvmbPQdbGnSRenIbHPcn9Qj+tkFI3cZEQgZSPzrz9A0BA9ZeQw7
	r52P+v4LGdbvOFimXnBpZESiOWOW6iXsEyn/gSgR4ViEzt0YdL6NAC2JKZW4TQVkXVjlmT2fORJUU
	1ytLp4oxsrLRSj+P8zLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8w6-00000007oPK-40HD;
	Wed, 28 Oct 2026 19:03:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vn-00000007ntj-03M9
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPF671026764
	for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 19:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=; b=YGsur7X5LasPkQwJ
	mAdLe+vSNO8OTd9ob+3LiQLsw1S62uw5lOPc+VszgumKjGmHuZrFC0dgdKWowhLr
	xaKbD2MpWYvNY6c/nHwuwICSXjjAqat77NRNB3G0hl0C4SCEE1Hd+D3Yo8RlYp92
	rErNH6rEjT1du9HtHVkxu/YMZkSC0r03d+qv9vtGMyAjNqyERhTAjDp5fIfH8604
	Evbexh4XzAv3fz2aPT4YhCncO53WMzvuCuj0NPCC9xIRJGy9Sr3dMkYVxgs9VQkC
	t9SYxk3heV51tiyj6I6DRSEFyKC7aGQa/6GX6ovL0Dtt1hC/gn9g4jJ74Wou2IVr
	60Ibag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28e0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 19:03:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2091420eec.0
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214205; x=1793819005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=;
        b=CmKJcaho4pLPwJF1Z9TK70I6beWtQJwGvc0hGEwmXwF3oiPXCEI7/nI7TFFJJTish2
         S/uPGFzzUBYNlblKdjzIg31iX/dZgCK/71zCBEGaSF0W9YsCpMStS4cJbkI2s07tbHsB
         HC8DOBnY47hwY0Vz52C0qfgGdVns/vmCx2UBXoxzpdzKGqflCv81SbynQE7B7vuswlic
         9o1OmOHb3X7tP2O1HXTscYnMOIaqbSMDj5ikc/dKazXvoEuvn895DKcHzaUvvho/OIZy
         fGQkTU4A5GiurmUHs2Lza6I6oRoxv8RmAiU4xWfZ+oGyJxYXnM4pu5EjYpoHJlQXpz8W
         aQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214205; x=1793819005;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=;
        b=e5m8ZsQPwuS8aXR04kT647w1n8ZRAJrKVVSw3F0cOxZfdMxetsLdLMVRlXcGKb4nLf
         L8T/XpDAEbvVQEC/GKBWC2IOwmHPNIY7H4WTlhd7eABZuhd35Jo1WmPbkeD5D1rO8/6j
         NeOEBLhKZT70oSQpXnk0p7XbCBcRYzSXF1dGj0LDyVQZ6UYdUrvH7BJnbz7UabuVpkGW
         ENQpJAzSzggsr+a0gKEC1hyhfWBVyXXMJ5D071PE8iWzpzDXVu94N7ByL8ptNEGbMDGk
         thwYRWbvmCoV1opByeJSAI62grgVzdRELc5iPhxao+6f4F8ZPGVj69MIrExIERyvFeRU
         afhQ==
X-Gm-Message-State: AFq9FYKB+MMUwMtOUh6XaWi7kfw349wyzJt5vXTi6b3fjl7NuxWe4XF2
	BDUz/3uRbJiss+93eyB7xG5CLlZF3bYGDd/LNovE7LZEmrfAL70Do4kNmon8iukBPokzR0aFvL2
	/TQulsETFP1E40TC/lbFAk09hF19JVAEwuNnjPSQ+KRf2CWyhsNHzNNzH8PiRmqgp
X-Gm-Gg: AYBFou3lfQ61A3Nk2CcS7Imezlb0l4fCidXhul/X1X/zqk7RoZr+KUmQjKqlPEQe8Bo
	heiLr/tdWNa2qBpVnQgl1UzmmWY2r9LQnUgc0SyIuMJAhMWMlhGiDUt+9VCaAJUBpDUAc5xSvEo
	0s4cZUShkdNTwbiIGZQxCKXROTzHZ7wjX8LzgWkswugxyqSnuXHsSK19y5ciZ7aiZZx16dpY/y9
	OCHe1J8si2zXZh/Qo2eCGBB4xBzGm4DMEaKaeHm5pvEEd7TQxjNttBtZ++ZKw1TQj1t0ynhJf3J
	kVssg9H7wdp9Hppl/J5YhsTmSnOHWcEGSG1qhtiUbaZ2WrKZQo7cAmr4qCJF4sRwtMbBboYxJa8
	af6kyaaXC4xs095AJqMiZizU/xEyHxPDr6rth5MG/RKotfmfPTATNFMZmNWWaycx2XjaB+F+5Hc
	ZjEGGncQuag7gBC2osoTfle5/ROdux814=
X-Received: by 2002:a05:7300:d508:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a2014adcfmr6673857eec.14.1793214204813;
        Wed, 28 Oct 2026 12:03:24 -0700 (PDT)
X-Received: by 2002:a05:7300:d508:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a2014adcfmr6673777eec.14.1793214203994;
        Wed, 28 Oct 2026 12:03:23 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm19055196eec.2.2026.10.28.12.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:03:23 -0700 (PDT)
Message-ID: <7ecbb748-85fd-4a5b-b673-3f29b683e8af@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:03:21 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/3] wifi: ath11k: add a module parameter to
 select the hardware mode
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Semih Baskan <strst.gs@gmail.com>
References: <20261027075544.19144-1-julius@bairaktaris.de>
 <20261027075544.19144-4-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027075544.19144-4-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae246fd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=stkexhm8AAAA:8 a=pGLkceISAAAA:8 a=ssmgTYQ7C2hsjJ5zoukA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-ORIG-GUID: Yb_gFUUZ-EZqJ0yQ83rDqtIoHkL6Hwv4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXzu/+e2AWhd6y
 XoPyRvwpPYYkyqTTY+Rw0efwCRqGrOCgtXP86iNk7mkK2S5Mq9BSAlVyoaDT0OFSeZ4wj5sx2JQ
 A+kwyUz4uWFOujkl5b4I5kgDHwVI2oI=
X-Proofpoint-GUID: Yb_gFUUZ-EZqJ0yQ83rDqtIoHkL6Hwv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXxkVgw6a1oQ50
 gNrKTFstgsDnBeCxXMctJweoeXOeofIuq15R+posFt4DmB1ge9+daP8L9/jeIjkbN273ml/b4gi
 COAwsMylUhrkGmxUf+f4cLkpKdVaauwKXc/YLJNnRYIck0Vy23o99+b2+ePTWHB6zNkuTxtl60a
 aryTNBRIn3IHbT9XdjGlr7REzYUuWt1HJEcq6iTyeEsqqd9UsQLT4iCMSawWlpULmCD94LkI2fT
 FSxKw2LGwIu2KHeuJcePfnhkUII2wdew9cPp696qBwVTIT0XOYCQNuWCfHFw7d106ztYOzsFGnT
 vPHMbdKWvwHyR/7xb+rEF5lsHiqCeVVzMZuzuQ5SO/Fg7/v+m7SXyPVEMI/kJrumJXBpC5K5ijx
 96Hty4bU+5tb1yVc4kCvbV7+IwkvUbihqRfYNy3YTVv+vPAgaCTju08+D4pN3/9dOoFviADI4nM
 BDsZaFv6Ypq3RFQGOpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120327_073092_B071F0EB 
X-CRM114-Status: GOOD (  18.43  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 12:55 AM, Julius Bairaktaris wrote:
> ath11k always uses the highest priority hardware mode the firmware
> advertises. On the Zyxel NBG7815 that is DBS+SBS, which splits the
> eight 5 GHz chains between two radios, neither with a 160 MHz channel
> width. The firmware also advertises DBS, which gives one 5 GHz radio
> with all eight chains and 160 MHz. Add a hw_mode parameter that selects
> any mode the firmware advertises; for a mode it does not advertise, warn
> with the modes it does advertise and keep the default.
> 
> On the NBG7815, hw_mode=1 brings up the 8-chain 5 GHz radio. iperf3
> from the router to a 2x2 HE client with 4 streams gave 1.22 and
> 1.20 Gbit/s at 160 MHz (two 20 s runs), against 886 Mbit/s at 80 MHz
> with the unpatched driver (one run).
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> 
> Tested-by: Semih Baskan <strst.gs@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/core.c |  6 ++++++
>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>  drivers/net/wireless/ath/ath11k/wmi.c  | 17 +++++++++++++++--
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 766ae27306f43..e1a6085a065a6 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -38,6 +38,12 @@ bool ath11k_ftm_mode;
>  module_param_named(ftm_mode, ath11k_ftm_mode, bool, 0444);
>  MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
>  
> +/* hw mode values are mapped as per enum wmi_host_hw_mode_config_type */
> +unsigned int ath11k_hw_mode = WMI_HOST_HW_MODE_MAX;
> +module_param_named(hw_mode, ath11k_hw_mode, uint, 0444);
> +MODULE_PARM_DESC(hw_mode,
> +		 "Hardware mode (0: single, 1: DBS, 2: SBS passive, 3: SBS, 4: DBS+SBS, 5: DBS or SBS, default: preferred mode the firmware supports)");
> +

Is there a different way?
Adding new module params is frowned upon.
https://msgid.link/6d553cffcb0ae84e141006ae1430f6f37909ad2b.camel@sipsolutions.net



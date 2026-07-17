Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4C8C44515
	for <ath11k@archiver.kernel.org>; Fri, 17 Jul 2026 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSY/c8X4QNDRsgky4WEPtXl65kYd8TI3cwZ3M9kfC4w=; b=DmE7VXgPSIt9Rdou4gOKxedLl/
	oepmOP5PEGFpGAsq2A2nlXnh8RY9ZH3Xrb9CoAHqhBssZnYFCmsEyw5GOEbcC17GEcUqzXeVgQcxu
	qyQWNQZ3GiRlpLIUhpMqaRol1fpVv6071KRhA1EuJZueH1CNp0UTIX57XHRiIzUP6ogaHb5SI9Up4
	+8jv3Y3jym2DH4KKpo6wYzE8F0/O7+wABialv+DyBQOdn0dLqiL/jxvRWQMMQXlb+NC1WIDU5kzpq
	XIh8B9rPsnf8eXteJK8oOkO/KJEizjNpM0owRgXJjJD9v0O0VwrMq1BdTyPQflbbn9xEDEEXowqZ9
	1oySJttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkls8-00000002nGW-21JK;
	Fri, 17 Jul 2026 16:57:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkls5-00000002nG2-4AGo
	for ath11k@lists.infradead.org;
	Fri, 17 Jul 2026 16:57:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HGo1OE2043295
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 16:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSY/c8X4QNDRsgky4WEPtXl65kYd8TI3cwZ3M9kfC4w=; b=G7XdTxrGFuADNFw2
	Ciop7rnmpdTsVTZ0Gxtlz9Hc4tgqqEKhYuCGsu3Iidj60czRSXlkxGokK6N46Gdn
	8OUbFbSdaIrSr7YOEfg1FbSGxuq7GoaXps1g9i7qjoTY+CM7icARnBQLRXmeaAWX
	n7kfQk1lReNwbJjQTCx9DlINACSGLJoB1bhyrJVUDVq94TBk86KW9idOZjhAwvD1
	5I7kDVsthui277bvp6j1+muMH0Tphohtr/u6N5aSYiZTdq3PO0AJxIGn0Q4EgJYx
	UsaR2stQoK4GJ3bFx1TTjZYJw96VRq4Jx15CwQHDlnoBgKy+nbqpL/sse4NcMilV
	a2aZzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78smd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 16:57:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3794224a91.0
        for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784307429; x=1784912229; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSY/c8X4QNDRsgky4WEPtXl65kYd8TI3cwZ3M9kfC4w=;
        b=A4XtUs0ADChBXVaBM09kIBpR1BBo3ubM/BH0PfjiSdcGwTIvI/AG6kvlRKo4e0M3Gg
         y8gRVSmPHdrM/LeL+Cw/W7hYTx6/XK74kTtzx6RmfcU9dcSv23HI7AIJOSrDia+86vJK
         aRN+R1oVs4ujR9qYq1IPiA0js0NYXDCGxTx6eAIHXUgmY1EmTGsrlRXOpeUJ02kgRfFK
         Wh22U3XIJVYsNA0RHemuMnhYPnrGky3I/1h5AsSSeImfi0Si2kRlAsNd/12f185eQWvw
         Vjt843qx5u0b7eyWDO4H2DGVS0rsTtfCVO72CW1msLX+rLXI5lBI8Rr28/mwNzek4GJX
         C+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307429; x=1784912229;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSY/c8X4QNDRsgky4WEPtXl65kYd8TI3cwZ3M9kfC4w=;
        b=HoTDFCWBJddISPa4iDcnjoNj8sQFu1zHyrmpga5UCurxxDnrB7EZt7Ht1IN/kdAhlv
         DQqwY3cvrb17wLD1Z1zxhJTjNNJN2Z76wAKRNw9AqzC0JvuTLE4McwO7lBbe1K0KNayo
         CX0FTDwfI+AhuKPaq4XvTAKeFeLWfiFVtuFBug996Dxxg05RtHSeOL2zdkY0h/hy5RDj
         fxnNEbNBM5VMxs6LDTkc5H0R+4HsdyBmn1kKlmIbbdLtmt8yzWCv6qMG8Mo9qSVgMVxx
         /YakPgDkLByZHLy5XaS8oY9G9xOpN36QvV5+C3CM0VNvjqAkgKjeL3Fk/pSwh0dcnGop
         tbFg==
X-Forwarded-Encrypted: i=1; AHgh+RotBZ6vEEHYwQe46Of77o8Xplj4cETxGeW+hCPZwPntc0f34PwbJlHSsmKAyW1iUnMoiYwk6HQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwkzJBpgRywYZ6tS25XZBfkp10F698arEvPEj2wZFHNsAgN6Gw
	VGPCK3lmYtb/FxzGIAefm4p7N9ZdoGSoVMvplVsuPXUlUEDSkws8OIgfVdoGDhonS6U09woZrVH
	DJ5gKalBIiCt9JnYa24DEsb7GZSwXyCoX8xVQNTdrwIm46eMXQoTVIaIqGWXVJL5I
X-Gm-Gg: AfdE7cmYZ//A4r+YnOhHJogvDGVP8/5iavyRuEkDrlDbFDYenrxULUScvAQqel+lfVh
	JZzTDs6MBtBtoiDsNKgcHo/SH1GPw5ejxt2NKSIyFZvTb56cagkRag0nJmbxbsUXk5/kkaKU/eF
	T5I9xtMO4KQpDvI7TwAxSua/JwLq7YB7+mJBPVpfwpblaRY112nrxHkcE/Fk9H9rxLRt2i5DSPk
	Eq0jrh8oJKdBdDxdWJ9IadO1k8jbkPynU8rINy5c3e+ESBnjf3mOE/JpwzCZas2pUrjsY1x0fJH
	SEcIlvAAlCNqJyyjlbfFhZxrsBSmm9HDnWp1gIdq21ZjVywDnWjDYh50bmFwywppGwuEGUTVoK1
	FvN2TlSYaX8SsFMMUF09Z4vOQyUJyL8V7TZRlDWDiMpvD9rwD5DQB0Ha03w==
X-Received: by 2002:a17:90b:3c43:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-38e4b48ec79mr3712953a91.14.1784307428648;
        Fri, 17 Jul 2026 09:57:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3c43:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-38e4b48ec79mr3712925a91.14.1784307428145;
        Fri, 17 Jul 2026 09:57:08 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm9002731eec.26.2026.07.17.09.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 09:57:07 -0700 (PDT)
Message-ID: <4c9d3a9f-ba1e-475e-a8df-7afd13effbf3@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:57:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] wifi: ath11k: move ATH11K_FIRMWARE_MODE_OFF to
 ath11k_firmware_mode
To: Ziyang Huang <hzyitc@outlook.com>, johannes@sipsolutions.net
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE3MSBTYWx0ZWRfX0akjwKI2cXrB
 DPoFqzQ6MxEJ5k7t+92f2qfBvsVHaMrXCyDn5TW2doFia5YukDxf+YZUpyTRRAKX/Wp5hZZMZRd
 aLenoO2isiD9hONqVsuQLXehnZ4TG+dht6va2v8Fq2TWCp9idoyj4qDkVCh1BiqQmh/OTdBlGq9
 wL9WWsbBYr05xmN4aBalr7P4A8cTH1Iw7cokOTeRsrgn0vyYo0eSPuIvbynFMC+nd5HC1uvP6Yq
 qg53XYdVqt7Cqgj3ysoSLN/rO0F0lk9AxD7iVRykPAZOeV8/sCiI7eZTgb+9i8QvBqarAtNxw7R
 YgUFzH1yP09VGvoPHBQ9B4O5NRA5DId0ZQ38SnoZl/GsNIUDPZ+97XwdSRITNmGivWZq7+cDwWe
 BagdZhRf0SvS2a9Soxm+/cozO7wnbwhTkdABTbZgUjSCStZNoXKLC0B2AAd1Cs7vkiufYaQW2On
 Kzd5lt6+kQYjYxBoSCw==
X-Proofpoint-ORIG-GUID: zlpGfdhTYCqrEIdZA8MzYhV4dedDhdUD
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a5ee5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=FN9edgLifu2y3Mit8RIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zlpGfdhTYCqrEIdZA8MzYhV4dedDhdUD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE3MSBTYWx0ZWRfXy+zL7VZ30rl5
 QlFAbvE9g2NuZ5r4qU6MvwL9avzT4v75oA5iKiVRNyMN88/5ex58Pyu0TAxsqOUc6F/IDvpfKXk
 MDNBUdJmF99ed1ww7cqF+z6V22ymQxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_095710_043086_BF4B1419 
X-CRM114-Status: GOOD (  16.72  )
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

On 3/3/2025 7:31 AM, Ziyang Huang wrote:
> Put it together with other modes.

your commit text should be more descriptive:
Describe your changes ... as if you are giving orders to the codebase to
change its behaviour.

> 
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.h | 3 +++
>  drivers/net/wireless/ath/ath11k/qmi.h  | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index a9dc7fe7765a..bfa2e8b21b5f 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -158,6 +158,9 @@ enum ath11k_firmware_mode {
>  	/* factory tests etc */
>  	ATH11K_FIRMWARE_MODE_FTM,
>  
> +	/* power off */
> +	ATH11K_FIRMWARE_MODE_OFF = 4,
> +
>  	/* Cold boot calibration */
>  	ATH11K_FIRMWARE_MODE_COLD_BOOT = 7,
>  };
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
> index 7e06d100af57..5e8fd22bb9a0 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.h
> +++ b/drivers/net/wireless/ath/ath11k/qmi.h
> @@ -36,7 +36,6 @@
>  #define QMI_WLFW_FW_INIT_DONE_IND_V01		0x0038
>  
>  #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
> -#define ATH11K_FIRMWARE_MODE_OFF		4
>  #define ATH11K_COLD_BOOT_FW_RESET_DELAY		(60 * HZ)
>  
>  #define ATH11K_QMI_DEVICE_BAR_SIZE		0x200000

I like what this is doing, however IMO there is room for improvement.
the firmware mode is part of the QMI ABI and hence the enum should actually be
located in qmi.h. And that means any .c files which need the relocated enum
would need to include qmi.h

And if you post a v2, use ath-next as the branch tag, [PATCH ath-next v2]

/jeff


Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2106CD37B7
	for <ath11k@archiver.kernel.org>; Mon, 11 May 2026 04:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EhcPMqV8LfsmYPtNXO5uC1iRN/cyenwSX0ewW/WPQ0=; b=ZJsw8D8UR7yt8LSfOpVh5ChmxT
	y5sIYmPf/dzKTSu1vzehzPJYGfl7r5HpI3qm5GodOQGd4u9Ogx6+4wdpxoog6xvrCPcJWx3Vvhavg
	p6ubd4aKd0Bbw9rB09wALSKUsLsyGrCmS3ybss4/SelU7b6RCyPbviJa3dgpi+2CuSRT4C6NWCuqK
	ZnjNSd4bWdTeBHZL0tsAG7QLaDV+2btbFxBvue3P5Xn/KIIoeEgkHew3pW/t2J5hvNvCCxdkODf1C
	R4L0wT1WsTdM+8+/xz4bNGHmEVuz+VQqDW3LKRbuxOHKyH/+r0DCok0qLUFPBCmg9lRg3YuLLvy2N
	WP804ijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIgp-0000000CJJg-3k1R;
	Mon, 11 May 2026 04:56:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIgm-0000000CJJ8-3sri
	for ath11k@lists.infradead.org;
	Mon, 11 May 2026 04:56:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B1Vlvr1015744
	for <ath11k@lists.infradead.org>; Mon, 11 May 2026 04:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+EhcPMqV8LfsmYPtNXO5uC1iRN/cyenwSX0ewW/WPQ0=; b=ddc06HoTu38UgR50
	E5pU3plbkWYW3rW3DJ6n5kr/wqUcoe73wAbBA1BnR3Y9RYoLnlzWUpW84KbSdfu8
	Ctl53XuXnG81MEln/K7AouTFb0sO3AJYQ5lu3PXJnmhRVUdGDsOB/rD2gR8elQun
	LFrSLpm1RP3aZQUfSOldEuh4R0nB7u8O1BWhLufiXRKCevQkasrPTeuiMLim6LXF
	YcyRoJQfIKf9dewoQxwtoeVDSDSyM5DoreMCfvTGJ6ibbKmoaoOoC+d90Oj3ybMi
	L+9ffzyDXWe+yp3RPBa/PsNZf/p0o9/sN/ziB/OrYdQbQULhW9wxKSvIJq+f1Qjg
	TkesSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q4qnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 11 May 2026 04:56:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so40119415ad.1
        for <ath11k@lists.infradead.org>; Sun, 10 May 2026 21:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778475378; x=1779080178; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EhcPMqV8LfsmYPtNXO5uC1iRN/cyenwSX0ewW/WPQ0=;
        b=keeE/WH1ZPK6oq2tsoyl/DcR0UYSRn2BkPhw/dnEcPN2xqD0flMmj7t1XRs+EU/Uuy
         1l3xN939Be6lCkdErMFAObYv4IqiK+w5vYo8JZ1x1oa63FphPWqrsCTlNAyO1ovk73HR
         /nvOpFYS9h+uAJ6Zz3Lhf+9Z8G2brXcVyGIxE008DwyMgSmERpeMdDGuOkOvcsKJNNVs
         d9qsid/Qyz7dEsL9zV9HOTj2Z9+g1incKP5CLdOvCvtNHRhuNlAQj6Ud3ZYEQnC4ghpC
         AMz92tWHp9bl24B2y15Mm935y9kRZrTdWrqm7pQUr26RudZv+DevHQkzpY01PuAAfKxS
         B/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778475378; x=1779080178;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EhcPMqV8LfsmYPtNXO5uC1iRN/cyenwSX0ewW/WPQ0=;
        b=ffQSA0bxesNIHofodKQ0QOVNbIW+oz94WQ07U1ceUamqCCAZWf3oH+Zelknvf4njvh
         Pjh/9U+mA+Hw04cLZVnx06iunjihKqQXdLMGbb0DgLvgOz1LDwgQITPVkexBTNYDC7ek
         giy0yMNBGDzVto8F6kho0RepK6jpGxniIdfeI93C+0jQec3EbIOxFVeBoZyJxHK24pc3
         ytTgWQO7AkxbxhqdaRiou5/XV50p0hINLttDflAeFlxEkUxVGXri8Hj/W33GQvYZXIzC
         ib055juRRM3gvdV0xC5V8L7CHRN3wl9zlmAB6q5TGvU69BY/ag5eXB53w6mF9PdDFl8C
         m7fg==
X-Forwarded-Encrypted: i=1; AFNElJ/hwRfh5h9LDfb2KK5O3/hthLFOYwgBZoFxU0q7FzeXDnxPYKy15oRWBgfrWlaCTrmYI/nHRfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFioAmUc64+3L5k/EAxtVOOmSeM3Py4A5ysPF+DrktV73wABen
	moHjYjZY0yLodpaWRGhLRlwYLu3OQp7bUy0lqrOiJ39cDLutdaD137INTSB0N+fbeaxaySSzhs+
	82tgsGZLEGSDbKnUCr+kTO15zs1MX9w/QvUkzFx7xo0MqtEpzz1vQa11rQgW1n2vV
X-Gm-Gg: Acq92OEU1e/ZcNQwcHfnKBopymK8WfaH2Q/KUT+li0JYkRmEyUiWrvqo2E9nHMIGvsy
	Z5/kPloE8XVloS6oIkGlEMr+neYrTxX6DSMONGgfFZcVBBIPN4BRaZQtN0j5lrzvSqNZBebX5u3
	sBMn9w/PM8ip1MomkUazs4C+4E4fQUu6jYT0IowKc+nEyAAIHsU7IQZTkbsvN3NaclRc4l2tPL3
	8Xf7LFUjA27khENzn5m8uCp1ynxFddAwPzUrS3sgfe0qhPBh5HveUqtQ6Vk8G3vpCeX36O8iDvY
	VRUPnyZROxcI4KO2iJUDbqwguM51MuCA3xyYxddMTag0qiWyYZFCKMNbnxfvTsQSDEcIn/IcnRP
	8NtUWql3U1o3evk8oYtPKtM/xuSF9wLtQqzGZcAgnqZgg5ZvGUwfcPf9rrUyXwUkc+lm+7zZlFP
	CxCB+UWSY+SE7hJoZ4ZGYRPoN8TEvXCA==
X-Received: by 2002:a17:902:e750:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2bc7a9ba9c0mr83512525ad.14.1778475378483;
        Sun, 10 May 2026 21:56:18 -0700 (PDT)
X-Received: by 2002:a17:902:e750:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2bc7a9ba9c0mr83512175ad.14.1778475378016;
        Sun, 10 May 2026 21:56:18 -0700 (PDT)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm88991895ad.1.2026.05.10.21.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 21:56:17 -0700 (PDT)
Message-ID: <2cdeba00-9e20-4cef-b84e-b4de4225fa12@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:56:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] fix leaks in some WMI error path
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260506134240.2284016-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260506134240.2284016-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U_3dka_GjQawUUlvVgJ35tuOsM56JAwI
X-Proofpoint-ORIG-GUID: U_3dka_GjQawUUlvVgJ35tuOsM56JAwI
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=6a016173 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6dxGyyh_nZznhl1tEkMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1MSBTYWx0ZWRfXxE0A0aE9CdeO
 AsdZeqXhVnYc9noPUSxMNTeFaqIvT5nbyISu3/O5IM8HNF+eYIwqNgeLlS2iHRx94M4zEtlJUvu
 zw9ltNwefcAAL4DhnUYPWkH9kOW6rSGudapfxa6ZYbPl07i25IPgRSvgUHnDbslQH/ihEsPISuF
 kwE/x1xqP7dAAe9L/18+Qd5vAe4SgPu7ModjQtwIurWeczY6XS9rBk15QMZPPaIYFK0qmChMmy6
 WX5trpyvqmuBONhhXi6MRa9WwcTB2+bCORS3Efrxj90btFLKOCeVncfY/oSoaZAC8X6bfq06GCw
 b7jT+2IftbfBgZjbiU6g5IBxE2QB4w0ozeB7ymCgQmtrGvzzKw4txhtGhzpeydqNfe3jOlrnR89
 98NC82+6Y074H3PhBP3IQ0308fYhcdbwNx43qRDe6yqMf6U14y9Qn8ohx5hjryi1zke9T5Dlctw
 l63OofDFk0j5t7Pa9Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_215621_099868_E11CE4A7 
X-CRM114-Status: GOOD (  14.04  )
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



On 5/6/2026 9:42 PM, Nicolas Escande wrote:
> So this is similar work to what has been posted here [0] for ath12k.
> 
> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
> explicitly checking the return value we fail to free the allocated skb.
> 
> This has been split into 2 patches per Jeff's guidance to hopefully
> ease the backporting process.
> 
> [0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/
> 
> ---
> Changes from v1:
>   - Added patch to also fix ath11k_tm_cmd_wmi_ftm() as per Rameshkumar's remark
> 
> Nicolas Escande (3):
>   wifi: ath11k: fix leak in error path of some WOW related WMI commands
>   wifi: ath11k: fix error path leaks in some WMI calls
>   wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
> 
>  drivers/net/wireless/ath/ath11k/testmode.c |   1 +
>  drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++---
>  2 files changed, 113 insertions(+), 19 deletions(-)
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



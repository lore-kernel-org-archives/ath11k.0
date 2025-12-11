Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7467D41D64
	for <ath11k@archiver.kernel.org>; Thu, 11 Dec 2025 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tztu8MTIBXFG4TzKiJ9hLxKbuxymdp4FTScUcSbkKO0=; b=SeedNFyKDph71Abl+RTd/20Dlw
	BNUvrZAnbyGlJOA9SQyRI5UjQoueGVcZOA4vW3U1H12bKMXb33bg1qORlGxD2w48RjrmpkM6HeT/s
	Z/II7y+oxzacNeELJ+OKNmVTUzmLM7x8/DLTGBaIJh4d3UG6hcOVCRRbDBHqYgp9iNKAlORGNLuWm
	JrrfF8poRVrLXsWTYUDMg1xnJ3NQf7uhP3nd+myIgAR8w6sRKo476vbFt7lN7jWR26b2suZCId8wX
	HinoGxy0bGKiHVG6+lnzxOwUh0WuCC8D/ATeHW/JrfGmy4e3FQC3DvLmyyo7Cl6xNRJgsa3QPD4wu
	lQc2YA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjlw-0000000Gz46-38L7;
	Thu, 11 Dec 2025 16:44:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjlu-0000000Gz3j-1NJo
	for ath11k@lists.infradead.org;
	Thu, 11 Dec 2025 16:44:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPlT12274480
	for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 16:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tztu8MTIBXFG4TzKiJ9hLxKbuxymdp4FTScUcSbkKO0=; b=d+woqyuDaG3emg73
	+uT0ANtO8v3vQZXZid38Vrp4QByPcvB0+x3iL/T0XeV5lF6BdkCoY8eUj9axfr2C
	QUzolQ5FtjX83Iaj+JJE5Ee0R3yTNoJ00qp4ZQBN4FZ0q5+kBwM3hWIZjwN1GFwU
	HijNwoZluvuGLeRmOUCZBWN7F2qVW04dVeDwGr46Qu4WjZqcJG9eEppvAutqsyoP
	yvo1xXkSQ4ERRzya07fArP6Uwdb4scIi0OHn8nfceseG+0vxfi/BV4kdraiqzF4e
	d7Q4bEgE8RViwfdQsZWyoKja1Hm0DOqWSpI3LPjx9/se2N0fg33SeQnq08P3P6Bn
	yt9Uwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayt709mw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 16:44:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d481452732so380545b3a.1
        for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765471443; x=1766076243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tztu8MTIBXFG4TzKiJ9hLxKbuxymdp4FTScUcSbkKO0=;
        b=PBYKlKU02vE3DcQHCZFzlLZ+Zn+6h8ZwGRSwd73Z/OON1dyhZhVuw564/aWBgOlvOD
         BxuuekGXrmkzmV0NXWsajBLcP5oEiBf/y3+5YU2+hsoSec37DLBQ2kXcdogZnPgln5n7
         gbyUYmXrTfK5+GUbRXZv0NVx06Md2apybah8b0m0CrlrUs172h3rdsZUE/P/rlGxQh0O
         MIDgwYPEEWBO1NYhmsaVJwuGQaBfkTZpuShxOQENSkMG0N3CXOAwXXqa21mtS+Sn/2aK
         ywOmksWpOivdSSl2hXHPTFpUiPLwtI08KrqnztIkXjdbpVdTpuZ9AoUWTJJS5XsYcC8C
         kdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765471443; x=1766076243;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tztu8MTIBXFG4TzKiJ9hLxKbuxymdp4FTScUcSbkKO0=;
        b=xMUuoHkxiVtXINSXG09J1DxjyyB05J50JD3Xyz+UGPksTspbkCRoK7KKrYpeKTlT/D
         YdlDv8NREe2Brig6C+CgphsLHUxDQAUJvpF9lqpU0+V/hKfcwzuwnf3KX01TYTXlO1oZ
         +4omMGwgwlupmSXaO+mgdAedihQEx4WiA2rlGT+lLBAUB6dL0vQ8Jiq3vlCd+NHGVHwI
         QG+N5XFCW9V6Kp4W6NNbX8/FH+fMkaBF+rAbijXQrljNdF3oyfGab9XkK7zr1rs0/FIr
         W1UmW1IEo4mlRj8HLY3ZedPObrEQ8DZLeccck/37bBV+gJ+hHXseQomJc/ItyF069CAY
         5Trw==
X-Gm-Message-State: AOJu0Yy79NoMSrdWsne3in5ajlyj7IlIdfMcEhDHjENzVeqwRMZiS4u8
	M1C4yWMnEMVZ1XPEhpAzYHygEK8onVHDP4Qs7wUkIQ7j7QluOpJW4YVTBCNwffZrylHgygKM2SG
	H4v42e16ChWwDnvHJCnnzijYFjUITybhRRFhmvuylkC7EDEJvF0JkcQtiqIo/QJHk
X-Gm-Gg: AY/fxX75uMkVsfoUJkdHTlPGv3ZdzbGKVW70gTnmDBYtDcI5XXcY+sw4kOSI+wrdqx1
	w5Qtu7dRDFGFUz24cl/HDPdulvpWF7KxFr4lEPH3548n15zv5Hd/e3av9VK5Dlyog2dm79oNE6U
	AYqX2ZJi0/fhy9Jp5GSlHMj2HGAa6oOWBoOyYUXytlsdSq8zi3gc1tUO7YerOBj/GQLHVkZ9F0E
	l5fWHayfC1BsROp5zqw8U6eGO97MrA5HfRMGR16bWamZgKZlbkxdt/U28XY5CdtdvX8+XLcHTOa
	hJ7k99ErPnFi9f2Z+yGmt3qcv1evmwcIh7bF8mH3Ci37SSVtPMOPFz39FGfLKAS8sYos0AFGwTt
	qOAOi+AbQ5F/jQq6Y1iOPRdFsaIPkDpKUxZJwR4eCUwlwLaS7B6CJE6K6wS4G3Z/MpnWUYQ==
X-Received: by 2002:a05:7022:503:b0:11b:9386:a3cb with SMTP id a92af1059eb24-11f296d3091mr4753901c88.44.1765471443366;
        Thu, 11 Dec 2025 08:44:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgdzo6qnoe5tg4DwQZAjSr2PiHeHaStQv2xagD5QxoaxfQkFgfxaYLW5CJjRkYp+TPKHhc3w==
X-Received: by 2002:a05:7022:503:b0:11b:9386:a3cb with SMTP id a92af1059eb24-11f296d3091mr4753862c88.44.1765471442731;
        Thu, 11 Dec 2025 08:44:02 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff110sm10048865c88.10.2025.12.11.08.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 08:44:02 -0800 (PST)
Message-ID: <f60bc80d-a947-4083-9e14-000a937de412@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 08:44:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 2/2] dt-bindings: net: wireless: ath11k-pci:
 deprecate 'firmware-name' property
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
 <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEzMCBTYWx0ZWRfX9GaqYXhGTON3
 77bCRgPaKtvFFdf9D5tKf25XUQ7vrhbrBdemkuIwYyOkuVhkgt9PzyDt6L/rZvLNX9Hx/7fO7ON
 C8ISb8usEArmx0gructF7kezJQQ09k4zDu8jNFEYSZak71h5EiAWDSNdRQKalcxHlMgu35XyhSH
 hz5eRyLu8Vv2fdWecu1mrgEa9fHbhWwur5CUWa7y+2XEM0b5oKClPMZK8xyCUdifVoN3BPEg9hC
 j2dESfmE1hDhDesmXgRL9+ZqNpsdaKJPJ/WCVXRCrCs5z188sNaoiWCrefkDDmgBBYvcZheOFBh
 0fVgjrKmVs0sqgcuJjDEq4mThzhxDuyEHvFuNXIu9uckTEUHTxs9eJWWvSA81SAeGpbEvNlokFV
 Yljv+8q0ZPEJetnpG8HUmUr1d4aWIA==
X-Authority-Analysis: v=2.4 cv=WYIBqkhX c=1 sm=1 tr=0 ts=693af4d4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nPuZL2kYLRZDsrc0ShUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: q0AKrGoUW_yPl7IpYPXjZsdFGW1oa21_
X-Proofpoint-ORIG-GUID: q0AKrGoUW_yPl7IpYPXjZsdFGW1oa21_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_084406_488604_EE195D35 
X-CRM114-Status: GOOD (  16.49  )
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

On 12/3/2025 11:11 PM, Miaoqing Pan wrote:
> The firmware-name property was introduced to allow end-users and
> integrators to select usecase specific firmware for the WCN6855.
> However, specifying firmware for an M.2 WLAN module in the Device
> Tree is not appropriate. Instead, this functionality will be handled
> within the ath11k driver.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> index e34d42a30192..0162e365798b 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> @@ -37,6 +37,7 @@ properties:
>  
>    firmware-name:
>      maxItems: 1
> +    deprecated: true
>      description:
>        If present, a board or platform specific string used to lookup
>        usecase-specific firmware files for the device.

The driver patch completely removes support for this, so is this really
considered deprecated? Or should this actually be considered obsolete and
completely removed?

Do any DTS files actually reference this?

/jeff


Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B88D3F082
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8QuYKjVLvret1GsI6cC3h1GiYwud96huRl7c4eEmng=; b=xumyCu8W5wvRG1vL0aXMQr1zA4
	BT6kJ/r8OhyTgLBXkhHDkRkb2dRzilLBPboCZRgARIlaLlF+ZX7i5U9yAYLd8b8JAsUrSjCgRkKYh
	zXLwxpxCsFfPuVaPPtlwk6bAv9n/eXqC/nn5Wk9UYu7Pn7L6VM2GZeeeUA+/Nsm1OPJqyo1IrCA3F
	cIQhZYLgIxLXWC9vWhqTlIUy3/Q/bkQzR9OwCMdCmmKcoAyCQoZonHeX/GoVg9wcOCwK4PAqWSLKY
	xlw4iB4DcAy6FdYcLVGSxHajA6SwQGqdGvvZflkD35rjFAS+7dVDk0FRFdRZygYftY+SU94e8LK2A
	ZoE+S36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7gf-0000000GJ6l-3TJa;
	Wed, 28 Jan 2026 15:42:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7gd-0000000GJ6Q-2HEO
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 15:42:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFW1mE3879174
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 15:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8QuYKjVLvret1GsI6cC3h1GiYwud96huRl7c4eEmng=; b=GMqyasNnooSdxV/T
	GFg5h5Y6fi5w1/In5brGktJ8cxiASgFkCh8YBJJQ/RNG1757Fxs3g3JkNGyVM3eK
	0yCG/LfJSx/P2he1/CaHLYXAg0e7hfx4X7JptnAoOnVdzWkAV8rsUul67YhtOjin
	z3rN5t3xroPwmrL+/a51j21jjY7VjMTrToKQ/NRnzi+l39AZHOVWdCRRfhcEo/cV
	kStm0yoWuNNWrgVjE1i6TnCZq8jpeEkOrKwm2XtT11Pk0DcSIyHk3dt5pnVmXZ5U
	As2SmannLcYMOoiE9b3MuaDqC9fQRFEorpBP/bkbU6U3Z/k1Fwq/hteBHXC9CzzF
	/ylALA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv26ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 15:42:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ec823527eso11748353a91.2
        for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769614949; x=1770219749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8QuYKjVLvret1GsI6cC3h1GiYwud96huRl7c4eEmng=;
        b=Ybsb2mecVoZx//ZCEjggLfgegVlKomUwD0lbmvgpactd+nueSwrDtYl79iCo+bPdaQ
         ln52YSsjS8JguKf3uYKNB8vZlyOdIe6ozKHj5bDgP9YOz9tDst7JxguHTTpjJ423JweC
         vJWU7dnY61GrbKWzUZFDA7vTK70QxYKr7n7QnKLvBzfgqzBUb85pzHYAMFE2LLKcIjFH
         UaJ2GakcuNqg5xWoW/nsmuxn4KWDm7pdSKPATT0BckeABRfA9QgqBR30ZUQGsFfWYj3n
         HDCMWw8fbFiNE2Me/l5kBWGFbJEQDaknL+PLQqRy/TuTcG2b7CseciV9pxuKttWFC97S
         WFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614949; x=1770219749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8QuYKjVLvret1GsI6cC3h1GiYwud96huRl7c4eEmng=;
        b=MaLmVxNfurQ4Yq86SjC/SyYJ5AXG/qx6Se6b7CVdUuVQLhdpVbK39mJP6K9tdjZR0U
         qRhXJ3Qy4wbmBUM8S2oDEKW3xWB4HtVjqTMmQYiZlnVwaSAYHVbwUPBqckTXITtwgHTr
         o+2a3Aas5HMlIFnc6HfJ+ZQ4WjFaQCM02n4xzKrgXfOf4J4H8i9eHAa7tJLd5zu4zeD9
         Z9dH4ettqOS6RG/rbjdb1UkOddvocag6LgsyCUuMHSYkZlKGSIbBBN52PNVDzMPb2Iob
         Cx2PzAY2+BnMO1WBA8F5d7XMuPhS74ab1ErGVlHQNzIDYGVQzjI4OfFhDAx85fAEsnRc
         v24A==
X-Gm-Message-State: AOJu0YxmK4NDDKGXz9gcX7EoIjFime16PlDgjEYHdvbQ1kRvNCBQc2ir
	nQOjyXMH8QhmKgXWCVX/weLndkLdRQq5UQZTbcLRPH6FzungyXc9NUH1D2HC5wGM4/booLuo7SZ
	vI18mR8nbZ/qQwvXq1BT48WMYDvg/dx/vWQ3DUtnURW2LpSbJ8dyNL4cwoxWgQQM+
X-Gm-Gg: AZuq6aLmUsIYNk+qEtMzsbh2h7WsKfdqpXFllPUCqKkKqACS78AU9mi9RukGvFj6Er8
	A5bB2HmXGX3udOceaqjEFO+yoMhZKNUGSzsqxJ6X6QnYOH7OrM/FazBgezvL4RGKl+qajEnlKIg
	FPp2jWZ4btMFd4ARb/cMVenzyOUciQ2ZSrk4PFeCafign2RTLt3u1PTC1BMaoOigNZHeWJuxjpe
	ENJBSbK5CH8aLSr06HaYZh1zM66iLNXxsn8h09AvI6fcpOjCsj3mwnawRSrNgq4AkHC/LE7zx09
	JujvV9ezhd43p5F4IVuat2yp0jkJngc9Owza/0SG2rNSDVlJ+UI8Ak2aDxld5EHS3qj9j+jnG/P
	YTA1dcnp5nzCG/CBny+3R8a7jtu3gUAOwLAozzZzo3izNpXI8IMSP3moU2eZbWg==
X-Received: by 2002:a17:90b:4e90:b0:353:41e:1f51 with SMTP id 98e67ed59e1d1-353fedb0be5mr4436640a91.32.1769614949170;
        Wed, 28 Jan 2026 07:42:29 -0800 (PST)
X-Received: by 2002:a17:90b:4e90:b0:353:41e:1f51 with SMTP id 98e67ed59e1d1-353fedb0be5mr4436616a91.32.1769614948628;
        Wed, 28 Jan 2026 07:42:28 -0800 (PST)
Received: from [192.168.225.142] ([157.49.251.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6128942sm5836935a91.5.2026.01.28.07.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 07:42:28 -0800 (PST)
Message-ID: <ea99fca7-c51a-43f8-8fb7-f228b36d3eef@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 21:12:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-current 1/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com, krzk@kernel.org
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
 <20260121095055.3683957-2-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260121095055.3683957-2-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xr06kPToIALzhVeJQRVlXN0ALUmCbSiV
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a2e66 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ayGwEbGGg2t4nIWcsuXnMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3bhG5mAFE4JtUZ8DKu0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEyOCBTYWx0ZWRfXxboafcdHmu0z
 L0jcKgpmGqAXnnhFkZovcFFtU0xDpOe98iCjeuVVB06zol4EfD0YlHeidkisxNtuvgOuIZxsgba
 CPRfoFUJ0P0FnVvaCiaZDPtM89F1/Rll4ZFymc6h8RT+kwZSUq9/+/tQxIQx7qIy6hcw34SuxL2
 s2tSJhm0klgaGj7UjDkpAh2W1PWZUUbA6ddXqjFbX2PflJJQ8nxqOK9DK0e7CdJ1eULuGPmjvf5
 r1vNRZQ2ZaX4mohEXC3s9WuwFG2k2PaZEo01W481ePim9bAqDNtYbKvV0cpBtzmY4xjm+QzSOk2
 PJxnLqC64bSdbGZBWMaij17NMCaISiMxQtXHgDYQEGtewBvYUvU8jjXCg6JC+T9HGwgDZhWHBro
 OLGO+VKOl2c5Dd2BydKjHbjbP2r/4rMv2gc4eEo+O8t/kcEnaIZ2fx6Gpl+PW2c2nsIQCqzGyZW
 X4O8LjTw2jjSwmmBUMA==
X-Proofpoint-ORIG-GUID: Xr06kPToIALzhVeJQRVlXN0ALUmCbSiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_074231_727428_B1B6FAA0 
X-CRM114-Status: GOOD (  10.71  )
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



On 1/21/2026 3:20 PM, Miaoqing Pan wrote:
> For M.2 WLAN chips, there is no suitable DTS node to specify the
> firmware-name property. In addition, assigning firmware for the
> M.2 PCIe interface causes chips that do not use usecase specific
> firmware to fail. Therefore, abandoning the approach of specifying
> firmware in DTS. As an alternative, propose a static lookup table
> mapping device compatible to firmware names. Currently, only WCN6855
> HW2.1 requires this.
> 
> However, support for the firmware-name property is retained to keep
> the ABI backwards compatible.
> 
> For details on usecase specific firmware, see:
> https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com/.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware overrides")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


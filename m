Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A63CD8CB9
	for <ath11k@archiver.kernel.org>; Wed, 10 Jun 2026 06:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC7ZsgO+uB1177IYXfTaG7U4Jmv7/q1Wf0xTfPebL4M=; b=SZBgJd3/G/iFZU1OddO8BpRRGX
	mYAM2ytntN+7F2XtiALRnzAPmSdU1xE0IlOOazMbwkmCPnopqf1eGX3nG3QEZ9qVQr9kLZAzCoFs1
	M6foI9UYBrrCys6yqzkxtf0Q3KuTW4hUp2W0M6zgV/wkmGFsgf/PG5TfATj/Ddiby176DzSJZ1x95
	RYW5R0mmbmhnGQZJn60dDdkQx+fibC9zKjz0xJUp7VXJ2iv3Pe3MoL52icOwOWlozrSvFFsoKGlcu
	9TmviKPkKzvP16njhoM3rdn6PTV6P6LS/lARc1z8AhtuuWhJRwcZWYICWimlFPSXpwmEFwI99hKcc
	llxktSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCBI-00000006rNe-1Uvx;
	Wed, 10 Jun 2026 06:12:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCBF-00000006rN7-40RO
	for ath11k@lists.infradead.org;
	Wed, 10 Jun 2026 06:12:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2f7l2323941
	for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 06:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OC7ZsgO+uB1177IYXfTaG7U4Jmv7/q1Wf0xTfPebL4M=; b=QUBwL3FFUPQaTZ/o
	fr+grlE0xvL4zOwUcdmEQmik9qzzkfKIUjfzCrz7wOJ2LkfEL9Xvn7kJigigwZ4F
	wtxgwVBdAYLYz7OqjO/R4cuovHGFyXcMWFWa6Vh9wDppKJnx4voRkdd2OPJ9kOpZ
	C0QXubRXJH/cbYhFIJFeD/w/0C8gjvBme85Xy/jOy1pya0ioAF5WWNn4UQi5Bkkh
	6AHcGi/RFfJZEUSfMFonQ55VdXJlTKAn34zcueX+CbYjy2nHV8DqWybvBs59u9L5
	kzG3RQxgbllmTSy4mHkCfEMNJrocSZLzekyAzMAxZDhiKGX3Ksy1dNxf9Enad3hi
	MTwT8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeawp87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 10 Jun 2026 06:12:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0d0516ad7so65048285ad.0
        for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 23:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781071967; x=1781676767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC7ZsgO+uB1177IYXfTaG7U4Jmv7/q1Wf0xTfPebL4M=;
        b=HFavZigpeW5oNOr1ELygVJX5Vcos2C51CVKBXuZifBrHJNP8ZxLI0UEd+MoRqscL9a
         3MzhiBWWJg1r90qbsoQHeijDzknW1grikocrZSG5EslQTdYxw0UO7nVOZV0qw4qhpFyj
         ci88j4fSnaAVhosIi6mOWkCJLwwkC1UcfbE02T8HhtZrEJfaP4Mo7vJxdRpV8qa03nm2
         nZlojV96+CudFlc9basnx1/xy4vHkWoUBArPSYrPcKx9PRayiXVJrts2VOHhtD59pyH8
         FGDtlZit9uy3ntDOpDk0q82YPKnAnNyqUw27+AWfXUFr5pd7V0XeepmLS7rFj+Cd/eJR
         4Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071967; x=1781676767;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC7ZsgO+uB1177IYXfTaG7U4Jmv7/q1Wf0xTfPebL4M=;
        b=Uw8HQRtHFiqbFUAY7EOHrU/AiITNkYoUt+LuwP6hOLSV+uDEesqysGoamnnqECG2Gi
         yV8/zum4PiPTbBIEM+W20oGAegnGTKzQw2M/pHISZThRUEl+Ql4uXEMxzG4p+DyTReP2
         LiqVtah0gi53Z7+CO55bYc/zZrGlwe/42rOFse6HNU4RolSDwRBwn1WWwyU56FDi40t7
         QkMkV2hOXlf1v0OINa371WgEaBK4BgaNlkl7lnoWiZ9jMd37s+9WJAZ4Y7l4K+xt1vfL
         2FFoAa6S6FnbGGNRdDH4+cNs9ZHngzZWzcBDJeGfbA9ix2eOnGtTYf41gVuSOf4p2f3D
         utHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I4e0KFpwpnODAZG1VmImNxEGB7HuzjCNddc9bd3/rUvLBKWnO452ntf2qq6QPulB2fl8Rgc4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNH3wyIyUdUY7I1vRNZFirtaOzBgR4e3Glk8W2DxcNLjvjWFEP
	IFEgvrNqlVZWLTHmrY/DLWanXWjqWJCPkUA1JAHbzdfwuES4dOdjr6ygERC3UYhp6i2/wC+9WdD
	qdlmdB7TKsFkMfFRmLvPV/QOHEXHRorCiK+OQ1gccVuIJ2qdJfOVO9YhkVWtFXv02
X-Gm-Gg: Acq92OHWSdkYLrxW4YwAkhGeOKiyTp/YGbzcGXRwDhY79P32WbTNrgOmIQJUdv/6VzI
	UkkZIdKX7HjW1YPYxt1gBtl6EFzILCYa4SJVXgF4XPCLkQ/6mtuHMJzX5qTS1xYp6b1LSHzY1Nt
	A0caPAoI299epuwISdtp57P05kHqUuQrNO7MUMptMUZcwNertUf6OaLh8lxeni3Gq5mRkiRzsQk
	RRO02CGl9FfRQNZ57yn0P3uQMV3+v65q367ms7YZV89a/wPdlYgdlqJJJgnDNuLz9sDRj7ikrKS
	VrKTuCXlLnUX95Ji1Hb4nztgqVV3jBOL0cnSENfgM/HtDSWSX3AVCdAXTnS6Kn6Gq9kTeem6Alq
	jp4SGHnkel60TdPNB2MFVbYMQN3o4e/NA2KndYa0Ow0Awsnd3P7yMSrGq6/39pQofyJ4RQGy0iC
	i9M4mFfqmqsT9iMjuToKYhxscUP6qvzQ==
X-Received: by 2002:a17:903:2405:b0:2c2:8659:da44 with SMTP id d9443c01a7336-2c28659dc77mr131827575ad.36.1781071966584;
        Tue, 09 Jun 2026 23:12:46 -0700 (PDT)
X-Received: by 2002:a17:903:2405:b0:2c2:8659:da44 with SMTP id d9443c01a7336-2c28659dc77mr131827235ad.36.1781071966136;
        Tue, 09 Jun 2026 23:12:46 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm224303375ad.64.2026.06.09.23.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:12:45 -0700 (PDT)
Message-ID: <f8d875b1-c230-4489-b5b7-7677ed2ba38d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:12:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath-current] wifi: ath11k: fix NULL pointer dereference in
 ath11k_hal_srng_access_begin
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: miaoqing.pan@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com
References: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dJnuY_GDISVk9czpRn1I5qE-3gE0rTRs
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a29005f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=E4ruc0QeprPoJUAD4lkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1NiBTYWx0ZWRfX1wNFkKD2Fouj
 k5Io10hX22ggbAfGqGOpMNouA8vhTQPBx0wkIxh55swcfs7/EgiuKL12ikkB1iloOo+fchyD7Ri
 rmOOMYVW64icn0pmbZPA2GxdN5sFTDYbWPTf8BspnNbm4lC4Ube02Nszw3sQyx4CSuVX8XdzmEo
 1nZzXRpI9mFK8Gu9zSIy50B3quEObUMh/RLJpBIhnGR4Hdhv19Qh7IkNh26WlB8ZNf+zmpzJv8b
 fLyfG/2jusUi6OuJMU6FXd6FFA0T6BysiLLl3kBoRlpu3Yh9l7NmfBIAoFWAT5GpPPQff7MKqDz
 XdU0lCB/Z0yP2frf5gleOAL960wo4cHifaPxy2J2VbORIrKl5FQVck7EUjfstKgJl9rVglj6YDI
 0yhQij9Jgf6ssnePkOs2ihzm7JVUIqeWvoCId82IX37rfpC7MjBL/M6zqBx6eG2GgeBk6ZIDOtT
 frLPyu2+bo6VVGIW6CA==
X-Proofpoint-GUID: dJnuY_GDISVk9czpRn1I5qE-3gE0rTRs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_231250_118565_E244020B 
X-CRM114-Status: GOOD (  10.74  )
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



On 6/9/2026 5:06 PM, Gaole Zhang wrote:
> In ATH11K_QMI_EVENT_FW_READY, ATH11K_FLAG_REGISTERED is set
> unconditionally even when ath11k_core_qmi_firmware_ready() fails.
> This leaves the driver in an inconsistent state where
> initialization is considered complete although the firmware ready
> handling did not finish successfully. During the subsequent SSR,
> the driver enters the restart path based on this incorrect state
> and dereferences uninitialized srng members, resulting in a NULL
> pointer dereference.
> 
> Call trace:
>   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
>   ath11k_ce_cleanup_pipes+0x17c/0x180 [ath11k]
>   ath11k_core_restart+0x40/0x168 [ath11k]
> 
> Fix this by:
> - skipping firmware_ready if ATH11K_FLAG_REGISTERED is already set
> - setting ATH11K_FLAG_REGISTERED only when firmware_ready succeeds
> - setting ATH11K_FLAG_QMI_FAIL and aborting the FW_READY handling
> on error
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
> 
> Fixes: 6fe62a8cec51c ("wifi: ath11k: Add cold boot calibration support on WCN6750")
> Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



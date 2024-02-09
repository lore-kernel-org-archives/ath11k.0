Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1442C4828F
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkXqMXdfoFxKguZc6tdH9CCpBWO+EkZ6DvrLzeen3Pc=; b=xavw74up9Ea2tjtER1e8054LUa
	cbOpnmGsEejylAxlqjHYGayc09dAMZuCTlotb5jU7/Ytv1t6sWow0h9colcK7mC4mhSP6UsafpfiK
	nV55xcWIp7HVX9bKJl4xBZqZOZiPo7KXoSUs41MkcL5nrKsogU7HjdEpoBLFbeA28Iccof02AXega
	D0eqzkDqJoZH2ApllFgjNYP4w+9MSaEgA5h8i0BOWEeWTFFJZWTKNTTrdo2u4989/I6H/pE2cLxRf
	ev/9ESkRoEbPMBgg3/BtqBn7OnV+qsYb3DTQmxzNFzK40eHT+a3s4AL5HKf1fS9hfZlttngR2sdFN
	ZgKkbHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYW7y-00000000KoI-0kZu;
	Fri, 09 Feb 2024 19:01:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYW7v-00000000Kmo-3x8f
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 19:01:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419Gkr3u005845;
	Fri, 9 Feb 2024 19:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VkXqMXdfoFxKguZc6tdH9CCpBWO+EkZ6DvrLzeen3Pc=; b=YO
	msPfImJshsppdHSSGa6uIAyE+Xi55fzyMJgLcvoQb8LRoV6L9gqqiMyMgQGg9YW0
	iqtjiR86UaXT7WU7nBMMI8Wvs4pncZXZjQkCsq+eFIlwOhIwy+UrLtdqelY9Md+J
	HEGdIwBxx4Tdcbdsivq6ef/jPc0wNO03rc65+4U5sl9mPHrsFPlP0olqmYufEZVj
	utte3L/ajistGcLkhQYwixUs58NLsrhBpvPsnY8UDOa/bSLfK/am7ZcWMyDH12hu
	qCr9PtIB86lvEVxQlW3LaFWdTWOgKY/OZlcQYagm7cqg2aT6M3w8L9GK6THH2sLd
	H00WHeg+F7zjqXqKbRRg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5qvag8xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 19:01:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419J1SHj012070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 19:01:28 GMT
Received: from [10.110.97.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 11:01:27 -0800
Message-ID: <0cd0101f-7a76-411e-af1e-95b3017264cc@quicinc.com>
Date: Fri, 9 Feb 2024 11:01:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath11k: Do not directly use scan_flags in
 struct scan_req_params
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240209113536.266822-1-nico.escande@gmail.com>
 <20240209113536.266822-2-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240209113536.266822-2-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aj0yCSsbzrjWZQ-uPBSjkdCURcOdYVc-
X-Proofpoint-ORIG-GUID: aj0yCSsbzrjWZQ-uPBSjkdCURcOdYVc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=522 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_110132_017951_BDA4B4A1 
X-CRM114-Status: UNSURE (   7.00  )
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

On 2/9/2024 3:35 AM, Nicolas Escande wrote:
> As discussed in [1] lets not use WMI_SCAN_XXX defines in combination with
> scan_flags directly when setting scan params in struct scan_req_params but use
> the underlying bitfield. This bitfield is then converted to WMI_SCAN_XXX when
> filling the WMI command to send to the firmware.
> 
> [1] https://lore.kernel.org/all/871qae51wx.fsf@kernel.org/
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



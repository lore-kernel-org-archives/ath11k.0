Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC68C4828F
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70uh/SjpspiS47BwsBvXUNbn3xTcam28J4dhzSxqJjU=; b=UyQuHFwtEtPVsiUS64rOY+yKdh
	5u7vz7dyZyx7aE/OyD4HFBqUALLZPWTjCNffvt3gjT3Hn6Ctux/kLUMWCnwCXaxRKhg42wZhnfMmF
	OjLjhK5srvqmjDDDpp0C4JKUX/nVCtvz1UwzKIzh+8qt5QcoUAEGxo2UzPR0Gc0/ANVdvintc3hMy
	c8tlTzfnh8ZEoIW6/IQ3/bcySt78S0cqW6Hjt4qyLIbdzMFIEBFnOiajX4DNnBenZfPLIrI9p/BlQ
	Kx8VT6iPHwo/ugdwM2RK4Iwo84aTBaEb1+piDz1eAjbmYCG9b8f0Ho2/TGbcoAHM/UVuouRcnaZue
	gaeCc4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYW8E-00000000Ksp-00qi;
	Fri, 09 Feb 2024 19:01:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYW8B-00000000KsM-4B0v
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 19:01:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419IWlfp010062;
	Fri, 9 Feb 2024 19:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=70uh/SjpspiS47BwsBvXUNbn3xTcam28J4dhzSxqJjU=; b=Eh
	gqYVzJH+vz9wRVctCTp/TwDFRk/J0EhvRWX8yApqCwWbJnu9HaD1S4t+2dhj6/5N
	IlJFJUfLRhYrMj/EVBCpxrY0tQ5DYpeJB6fFiPgpka9jLhnCZrkU4I72VxbWcCVd
	QcaZYyK66th5ShWetmXJHx4NEy1M20Z15QXKxOWBlRTyR47wAFSPSMRFU1xvZUTX
	fOVrFK3D5ichEF13x50eOFJml+N3QbECvsNJHfHIQ656H1muwTIvq0s+dXo0VVsQ
	1Jj06nZmWKZO+/jQ7C2DvSnIL01qFGQw1+/SdAbwhZL9u8MgFDNc3EF4RP3CK+3j
	8Y4qsl5spi3YpKLzAVgg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5ef1skkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 19:01:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419J1kHd005510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 19:01:46 GMT
Received: from [10.110.97.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 11:01:45 -0800
Message-ID: <c79e3164-4b43-49f4-bf02-98fda35a6716@quicinc.com>
Date: Fri, 9 Feb 2024 11:01:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath11k: Remove scan_flags union from struct
 scan_req_params
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240209113536.266822-1-nico.escande@gmail.com>
 <20240209113536.266822-3-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240209113536.266822-3-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qMAEEOra08Ls2CqitsD4he7AmFYLQqwP
X-Proofpoint-ORIG-GUID: qMAEEOra08Ls2CqitsD4he7AmFYLQqwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=392
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_110148_075408_7554B883 
X-CRM114-Status: UNSURE (   7.96  )
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
> Now that we do not use scan_flags directly with WMI_SCAN_XXX macros anymore but
> only the bitfield scan_f_xxx, lets remove the scan_flags & the underlying union.
> 
> This will prevent further problems as some entries in the scan_f_xxx bitfield
> don't match their corresponding WMI_SCAN_XXX flags as seen in [1]
> 
> [1] https://lore.kernel.org/all/20231127180559.1696041-1-nico.escande@gmail.com/
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



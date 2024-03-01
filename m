Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E0C5478C
	for <ath11k@archiver.kernel.org>; Fri,  1 Mar 2024 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSf337a1gJtu6y6yeLmG/RPIJD+iwTIvRdU9+bSmbQA=; b=MskSwXQDPQVpDuXg+gzBotwjmH
	Zm6HmMlIxywQg4XHB2uzSb/DDcxtUYVHGK02gQbl1qY52/IWfdMTAXdxxXsEQpjATqNCMmpQX8wZ0
	O77hOlSwybcTgmskUpbF1hb938uiuga261jXrnXYDzfaj9wzlMsLCt0O+2MwkDDeNZrR2CQ82PYWZ
	vVelpu3nkaeRAwTMApxO2F9DKS4lk8TvNni4o89JckNF3xJwwAWCka1Ugfd3TqiUuYiOzotjcQy6s
	Qh6kcA52PNNE2FaRoOg3QI60fox87mw/aPtWUWY/ewtGLiOi0xL85U7ScAtGA6kb3VhvQBp0qzi2z
	sUMw8rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5oD-000000016uR-3Mlm;
	Fri, 01 Mar 2024 16:32:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5oA-000000016sK-1oTf
	for ath11k@lists.infradead.org;
	Fri, 01 Mar 2024 16:32:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421FxhnG010343;
	Fri, 1 Mar 2024 16:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=eSf337a1gJtu6y6yeLmG/RPIJD+iwTIvRdU9+bSmbQA=; b=ic
	YIQHBGzyRezMw2j+mFhfDtmU3JKJR97JqqYTprPtPu9zYivLBH7ZsyBffXb379Ji
	NgQ2V/AqjKc/f0/pjHs7jW+SYZLIZdBy+a67Fxm/T2yUeNCK5ah3aPj+SBa9UXmW
	Tafoabjguo/vXERnBfoKfeeEPhVEm2iDl6w5LRtAFBhEo7k5GcsbeSdo/5U7KoTT
	YnqqDZ3l/eYbxt0R19TyeZfd22SIkyG5FAw6e7GoYitco7DE6XsJTKYX1ctDKc91
	Dt8ziMl+w6X/fxYY7plNe3JydtQqQLVxho9ZvajNiOr3TXtqMJ4bZMbhmXGQmKO5
	JkPn8GLkAb0/fu5qr7KA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk4rvt1y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 16:32:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421GWOt9003675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Mar 2024 16:32:24 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 08:32:23 -0800
Message-ID: <6d02fd91-73fd-4438-8e60-427eb5c9198b@quicinc.com>
Date: Fri, 1 Mar 2024 08:32:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] wifi: ath11k: add P2P IE in beacon template
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240228093537.25052-1-quic_kangyang@quicinc.com>
 <20240228093537.25052-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240228093537.25052-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gGosYOFdXuO-yGNze7YwsAfXMNkJrL6I
X-Proofpoint-GUID: gGosYOFdXuO-yGNze7YwsAfXMNkJrL6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_17,2024-03-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=965 clxscore=1015
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403010136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_083226_644969_3C593272 
X-CRM114-Status: UNSURE (   8.24  )
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

On 2/28/2024 1:35 AM, Kang Yang wrote:
> P2P Element is a necessary component of P2P protocol communication.
> It contains the Vendor Specific Information Element which includes
> the WFA OUI and an OUI Type indicating P2P.
> 
> Add P2P IE in beacon template, and implement WMI interface for it.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



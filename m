Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986E5C54E49
	for <ath11k@archiver.kernel.org>; Fri,  1 Mar 2024 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWd8ARhwelmsK+7EeDHRYbx81TZPC8DHiHtlgAkXp5Q=; b=CI5wCxGbebtT2cmApN2cJ25mvq
	0HwFVvkuscsAj11GGe9r9L0Djq77UB6RkYGevQHVhj1k84YwRTyCPZhT6u7dCFmU95Je0Oz3dOyhS
	j8mdJ6oAu9Ebe7Ggv+HycR55ZLpr3+f0JKnE95wW70GhGeVvfEm5elL9xjJXC2GoHnhcLUll9EKYU
	D2Q2q/z63i+asUxESifXn1W/vhFkFX8dwUlSzILAJ9T6o7+zquC1rmxVKqAqAZ83Ust9M19wsuwta
	MVVE2cXB2q2tRYFxynJD4VTkM+Nw6UjwskO0oV1oqcuo3kJkZM8KLBhY6yjWUAB82loFisgKUHA/f
	PJ6Eevsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5oF-000000016vE-1Bfv;
	Fri, 01 Mar 2024 16:32:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5oD-000000016tp-2Hf2
	for ath11k@lists.infradead.org;
	Fri, 01 Mar 2024 16:32:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421F0rMn010205;
	Fri, 1 Mar 2024 16:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CWd8ARhwelmsK+7EeDHRYbx81TZPC8DHiHtlgAkXp5Q=; b=Iy
	Io9wlQlF7+E0JVKVcwWk4Ucozpq7MBHT0bNQ60t49PacHxs53BTEnru9AJ7mD/VA
	nWOSHS9x/ERALHl4srw/ItvCvPSqUXz38yXbaKZctim5Fs+MaR9UdkMOzquCHwxQ
	uy8NDGutQOPV0YzV+AdLnZXz3+aBVEdQ0qbGDIihZAQqWMDlB8dltE1yenAlJkF0
	rroV2ldS6CPl/nEZ6UnUgeKiq+O7nKUNl7gntWw0VH+o66s/3Vd50OLK060fIto1
	NADiAtgzm+t5vKKoBjhUhMw1/lTEIhHYNoyVaS1m8ofBwp+XG18KhR9rnq8nK0zv
	AdagCoP4O/rqOk2WohNA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wkh9rg753-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 16:32:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421GWRBD007716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Mar 2024 16:32:27 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 08:32:27 -0800
Message-ID: <b71873ac-3ccb-4be4-8155-706ad386e664@quicinc.com>
Date: Fri, 1 Mar 2024 08:32:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] wifi: ath11k: change scan flag
 scan_f_filter_prb_req for QCA6390/WCN6855/QCA2066
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240228093537.25052-1-quic_kangyang@quicinc.com>
 <20240228093537.25052-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240228093537.25052-6-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hb5nFv7QwPoCl7VaPaMQ5Eo7vbgMCnJn
X-Proofpoint-ORIG-GUID: Hb5nFv7QwPoCl7VaPaMQ5Eo7vbgMCnJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_17,2024-03-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=954 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_083229_741664_33983432 
X-CRM114-Status: UNSURE (   8.64  )
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
> Current ROC scan will filter probe request. So P2P device cannot receive
> probe request. But it is necessary for P2P mode. A P2P device cannot be
> discovered if it doesn't respond to others' probe request.
> 
> In addition, station won't filter probe request with common scan. But
> for station, there is no needed to receive probe request.
> 
> Based on the above two points, change scan flag scan_f_filter_prb_req
> for QCA6390/WCN6855/QCA2066.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



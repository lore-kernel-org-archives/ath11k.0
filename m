Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A6EC48260
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjHnlFwhfRg/+W+t0IhdhVIPwPmCY9RO9f2DiYCS50s=; b=MQeZK5MBClwsv+H+nPk+tbwmN5
	qGWpbdpjEj3TzVakaq33x/mRAuR+o3bwnUo+j8C7qZ4J73Ax7BqQsaGK67AHov8bSyNk9tuzuW98a
	ebw/CvgaLCF+GGUyhR3FWGTOmE1xO04qSABfEUaRw3LfU+ksGwM6aqOFNevXhOmee/CSTBdmj3BrF
	u+gWcRRTTtgaHr0TluJxZz513UWXvelOHEppvQhLT+WbOOzdIgaJwq7pDZjtaG/GcZ1Z6CkDwXNz+
	oXG4jdpr9s+XYThF1CQywP4d7Q+bG6xZtm58VniWFEEluLPCIvIBpLlm28s0HB++r4Rf0+kKKuXHl
	XniBgngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYEKR-0000000FcLH-2iut;
	Fri, 09 Feb 2024 00:01:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYEKO-0000000FcKO-2waa
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 00:01:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418Mhkqu026726;
	Fri, 9 Feb 2024 00:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DjHnlFwhfRg/+W+t0IhdhVIPwPmCY9RO9f2DiYCS50s=; b=ih
	Ov7bOdI3d7CU5uYA1wsOaGX104z03vy7oc7KAhEcb7D190ZqwhcDHt6zJ29nzP0C
	/6U8YvCzXSLbUiLDYpXO7vwjQwZaN/88Ck4F9hFthOvSTrGlJWB0yQzJ6WeWZ07g
	XFKm+7GFWVK0rA59uR0VwxcWocx+cx18fuHZ4FdADYbZuLCD/behiuAd+GErnDeZ
	OmBFPPnG82kroGEvxXX24d7fWC0icEAK36VxmIDoi6XENMudn1jk1IB2Ov9taSmp
	nyRViNKqBNceu8XrkBeTZFdt1lCyOVYqg5coISNr03vdjQni09OPiUND1mWMslxk
	uzkTrtvJ66YE8iv8XgpA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4pavjv7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 00:01:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419013Lb025433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 00:01:03 GMT
Received: from [10.110.97.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 16:01:02 -0800
Message-ID: <e8ecb4cb-bc84-4fe0-915a-cf6d7f1e241f@quicinc.com>
Date: Thu, 8 Feb 2024 16:01:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: mac80211: remove gfp parameter from
 ieee80211_obss_color_collision_notify signature
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <dan.carpenter@linaro.org>, <ath11k@lists.infradead.org>,
        <johannes@sipsolutions.net>, <lorenzo.bianconi@redhat.com>,
        <kvalo@kernel.org>
References: <f91e1c78896408ac556586ba8c99e4e389aeba02.1707389901.git.lorenzo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <f91e1c78896408ac556586ba8c99e4e389aeba02.1707389901.git.lorenzo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GCoj5rKq2pAFuEpS7cT3sOUEQi1il6_L
X-Proofpoint-GUID: GCoj5rKq2pAFuEpS7cT3sOUEQi1il6_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_12,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=712 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_160112_890364_4E455EAB 
X-CRM114-Status: UNSURE (   5.62  )
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

On 2/8/2024 3:01 AM, Lorenzo Bianconi wrote:
> Get rid of gfp parameter from ieee80211_obss_color_collision_notify
> signature since it is no longer used.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




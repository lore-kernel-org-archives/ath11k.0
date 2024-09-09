Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5AFCD4F4C
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzHz7THkziQEgqXPCjnx7uCmkZMMyuMMpkTozuIadsw=; b=AT+kSXlWlywB/qiwxcHZsED9iB
	c0KaYTYJDe3ClAbofN/3/iLPrjyDlYCZQ7DZ5y2XeLw9QaVkrdgaBH9ineT85Mf6SVkKGqmzOY+t6
	7jVaSnFY6OUKcOUA7+5f1T/rHL2Q+TsHY7K8InZ4xBTkdKeNdaRIoBnQI/HFbSV3oyLM6JCiQSUUT
	UmVVlHacWgXR4yHcdvYRuiQ/UMXYpEqKBJSLup0M8gQadOmEYLDKV/TFBBHxS2clCu2H2sZSjTosj
	QpNb2i6gIbTs163A8HH3JPWgXK7vw7OVixoIO6nhkspxntwmkhdWONo6gMroZpENf4CJjkVkpcXw+
	qdvqvWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snVOG-00000000Ofn-2buR;
	Mon, 09 Sep 2024 03:48:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snVNy-00000000OeK-0di4
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 03:48:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488NhjLc013350;
	Mon, 9 Sep 2024 03:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzHz7THkziQEgqXPCjnx7uCmkZMMyuMMpkTozuIadsw=; b=WsHefuyQynjnRl7p
	Kn7S8F6bRyA5O+mVylAeQPnamc3iMoz/lwsA/YLk/UKwy2n5/JKHBH45ulo0y7aX
	e6WR19ZrlRiLFIIQXjrVyG5ojqSh5z+Ut2lwM/FKx6Qv8dVa3ZiqGHJN6dlwORGN
	OxPX1iWiM7yexX1v4/PyVlnKo61foaa4q3BG4ETJnnERZdVB8tTNa8jYe3WSoL5x
	O8d/7LRboCrWiPp+aNH+YC6niqXIYOC27u7Q9sJFUjoL4kT/pVvhFmmqY74FyQHc
	XhbaHhoBX5dCaoNAi+2xh0LvvMLmZLIcXqa+NDeRiOPTFcw2/axC/kVGJla8ptiA
	Aq0Qig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy59sm1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 03:48:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4893mCvw003283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 03:48:13 GMT
Received: from [10.151.41.25] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Sep 2024
 20:48:10 -0700
Message-ID: <44a7d182-154e-49b2-afb6-c1289d472513@quicinc.com>
Date: Mon, 9 Sep 2024 09:18:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: allow missing memory-regions
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240904095815.1572186-2-caleb.connolly@linaro.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20240904095815.1572186-2-caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zuhaROB0NlZvzXhCjy-nVXHPpVfdopI-
X-Proofpoint-ORIG-GUID: zuhaROB0NlZvzXhCjy-nVXHPpVfdopI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=793 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_204818_231741_5B437857 
X-CRM114-Status: GOOD (  10.90  )
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

On 9/4/2024 3:27 PM, Caleb Connolly wrote:
> On SC7280 platforms which are running with TrustZone, it is not
> necessary to manually map the memory regions used by the wifi hardware.
> However, ath11k will currently fail to load unless both memory regions
> are specified.
> 
> This breaks wifi on the rb3gen2 which only specifies the firmware memory
> region and does not use the CE region.
> 
> Adjust the order of operations in ath11k_ahb_fw_resources_init() to
> check for the wifi-firmware subnode before attempting to parse the
> memory regions.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Reviewed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>


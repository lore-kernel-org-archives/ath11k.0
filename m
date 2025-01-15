Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12246C02180
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0j31EVrhvjMIoWK96rn3x0UwXqkBAwe7tNtBo6tiJg=; b=TKXduIQd6LU+Nw8vNMv0VWh1B9
	GjHywWErVuQbMlrYwniXb4PRsgTw6RIl/WG8XSPO5oJ0CXZQPKuFoUaYSDvfoBx/HSBTnyUqb+wdE
	VV2NklBwyHFUxs5hOEjUxjERlhFWBYjJLNxLR7/HDHZSD8XCZpWMC/kXfvY2QzytGmMdJphZNJhfe
	rZzBlSFIuIwQ+PI3WBkq0VOqMwzUgb9Q+nSXRp5Ij5FBBfq8UGPdH0qxevuaaPyF2lOls1AV0CLbS
	t4T0kWM9oQPFvlzSkx0kQHN8PY3oUYkvs0DsBsOD/7sCuOnvmyPrTv7LFy1b5A2l92XGVgn9w0W20
	PWrAIflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0xA-0000000BZNS-2YkL;
	Wed, 15 Jan 2025 10:48:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0x8-0000000BZMv-2XLE
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 10:48:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5maGD018913;
	Wed, 15 Jan 2025 10:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0j31EVrhvjMIoWK96rn3x0UwXqkBAwe7tNtBo6tiJg=; b=UTrdcqqB7A7VuJzP
	3qZ2Guwd40Piy+8Ycjh8TPxzE+q9hP+TuJnfzEdXxa+rbmQzjXCxEMJ5167s4ac7
	4aF/ha4BEOtIGafyvs6s27p6y7/fdGF5YQQpRj+wEBe1L8QnIoTLISASgJSWgitX
	DW9WQHzlzPA1JuFyAExkes8O+6ltSo9bgZn3pBCGuXyqbte08jp+gt2Aa/hIcNak
	eWlYoyih8zQnEI9sFFgxaJuk+elGJwtq9z5bJ/JHCusZNRKv9lmzZFStOMBp38fl
	QpKKjlVBEaH3z262+VUkVy0H9ewD0QwQOSQP2Enqb80aASJWMKmXYsC6o3lRMu9o
	1NztHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44676vrrj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:48:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FAmj0X027855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:48:45 GMT
Received: from [10.231.195.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 02:48:43 -0800
Message-ID: <1090a0e4-6a19-422f-83ad-4566e5c86015@quicinc.com>
Date: Wed, 15 Jan 2025 18:48:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <52a3efe8-c550-4494-af63-6b8c6894e7b5@quicinc.com>
 <20250115094636.132250-1-jtornosm@redhat.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <20250115094636.132250-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RM3x8BJx1adyUvfEH6LtMfsTbNTu8lZb
X-Proofpoint-GUID: RM3x8BJx1adyUvfEH6LtMfsTbNTu8lZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=864 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_024850_651072_30189ED7 
X-CRM114-Status: GOOD (  12.28  )
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



On 1/15/2025 5:46 PM, Jose Ignacio Tornos Martinez wrote:
> Hello Yuriy,
> 
> We can debug/configure NetworkManager on our own to get what we need.
> Now, I am just trying to get a solution because at this moment 2APs can not
> be configured as before.
> As I commented, if you want to have a common interface combination, please
> go ahead with yours, and then we can see.
> 
> Thanks
> 
> Best regards
> Jose Ignacio
> 
Hi, Jose

When you use 
https://lore.kernel.org/all/20230714023801.2621802-2-quic_cjhuang@quicinc.com/, 
the ap only allow 1, it's expected.

+	if (ab->hw_params.support_dual_stations) {
+		limits[0].max = 2;
+		limits[0].types |= BIT(NL80211_IFTYPE_STATION);
+
+		limits[1].max = 1;
+		limits[1].types |= BIT(NL80211_IFTYPE_AP);


In 
https://lore.kernel.org/all/20241125100508.3458594-1-quic_yuzha@quicinc.com/, 
revert the limits[1].max, it's why can work for my device. When you use 
combinations[0], it's all same as before. So ath11k can support 
STA+SAP+SAP mode(not include DFS).

Now I wonder to know why it doesn't work on your device, which is why I 
asked you to provide the logs.


Thanks,
Yuriy


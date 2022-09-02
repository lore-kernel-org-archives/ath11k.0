Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB74BC38145
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pjQpWxXpg/rSYohEY56q/z1s/iQ6qK4NZpeqboPZAk=; b=dxalHOHxQInRX8
	n4miZhsVVgwNNDo7KUUSK2+14PqEHNwtuf6V0A16dcoYw6/D2BpNrR0dclCKfYBzVu36gEI3M5DIR
	PclFfNvZODMvfzqE3ImLJJdRbJkIALdGwhw8+0TtBzequXOAw0wkRzJjJJih49XKUI4n6fXZ0g9uM
	QnKqeZNaVXOdIbTqb8rYI3n5dr25pDYOtXMmOANekWBBmDIJ17e0W6fY3LjYLxjO9kaI48tkcvk9J
	oJGesYfk9eqDQ+rv3WpLPQb3fhb99zNFZ7BREzGrabIE7SvzKErZMNjFQoKlOinTNMiFHsnlA44sa
	o9n0jBLVCXKZyZB0nVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6yX-005DR2-LQ; Fri, 02 Sep 2022 13:44:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6yU-005DPH-J3
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 13:44:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282CZmNL025629;
	Fri, 2 Sep 2022 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n4QDxE91DOeLikzE3ZT9rkU6ZRmGhAas02yLLDHaNPQ=;
 b=ekCPzDl/p3RRJLcwtvhE8A9rA0X+mmBgYBhn01UkuofZ55tvzvqwjmK72nZ4dr/iAitV
 qY3EIVmJ3XifVENj1l1NamC+SFDgX6z//XIuDk4XpDpIcLEpodZ4PtprGuEJQi9Kg45L
 fxWRsAhhieseuYaPS3NmOn246yV033pLw5HSNPglWuBRJsMxrBQaj+cZ2zhcuYruLfTR
 FN7RCrbhNHd7OGkiqOaeWkgmZd4eECAFWnwleGAyeXTwxAG+4DvLyMxYT2rDfxwuZ5G9
 Mx+7UTyKYEZ3UGpyKLeY7d0KcqBwXThX1dFMki/VlFImI9weeBoOnY5kEIY0+WKcPBPg Rw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jb3k3akdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Sep 2022 13:44:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 282DihGx023859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Sep 2022 13:44:43 GMT
Received: from [10.216.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 2 Sep 2022
 06:44:41 -0700
Message-ID: <11bfe6a5-0081-1cf7-b8ef-be5ab3d85ff4@quicinc.com>
Date: Fri, 2 Sep 2022 19:14:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] ath11k: Add multi TX ring support for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
 <20220720135113.15755-3-quic_mpubbise@quicinc.com>
 <878rn2aqln.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <878rn2aqln.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4IwdeuubSx5XeRTiS6qJ0zTDKbAXgoou
X-Proofpoint-ORIG-GUID: 4IwdeuubSx5XeRTiS6qJ0zTDKbAXgoou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209020066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_064446_671792_6211BFEE 
X-CRM114-Status: GOOD (  15.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/2/2022 6:19 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Currently in the case of WCN6750, only one TCL ring is used for TX,
>> this is limiting the TX throughput in 160 MHz case, enabling multiple
>> TCL rings on WCN6750 has shown an improvement of nearly 300 Mbps in
>> the case of TCP TX, therefore add the support of multi TX ring for
>> WCN6750.
>>
>> Currently TCL ring is selected based on CPU ID, this logic cannot be
>> applied for WCN6750 as there is chance of out of order TX of packets
>> and to avoid this, choose TCL ring based on flow hash so that packets
>> of the same flow will end up on same TCL ring. For the same reason,
>> TCL ring retry logic is also not applicable for WCN6750.
>>
>> Also the mapping of TCL, WBM & RBM IDs for WCN6750 is different from
>> existing devices. Create a new TCM/WBM/RBM mapping for WCN6750.
>>
>> Change does not impact existing ath11k devices.
> 
> It would also nice to document _why_ it doesn't impact existing (or do
> you mean "other"?) devices.
> 

Yes, I mean the change doesn't impact other supported ath11k devices.
This will be applicable only for WCN6750.

I'll rephrase it.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7ADE8FDC3
	for <ath11k@archiver.kernel.org>; Wed,  4 Oct 2023 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18QW/5fZRqMZovsvLGMcuVtg+JQ73P/4+YlGLrkFkyI=; b=SRS3r4iBRXBjol
	XthreCey6laX/5NqNCwwyNi6UtNUGh95sRW8UtSDmZGmk4szTMSL/onMvA/X9BIOJamzGjxMOIreQ
	YHR7bnYQLEtnE/KWI1WDJPqPSn6svcGumO93O13MdV/oMzyNhFTGOD/6028iAR/TRJorHIRMLQEbi
	8uOVJfR2CHGoYvxS4DGjUKU66dmQ6IoxhLd8+/ZAgZw5kaJ0fCc1svCq1Kua/sXAe3R2rSjBUS7Mh
	cmsDdhLA3wz5Pt3orF0iArhxe5xOwzn0gxjiyYQqdZm89i9YecoaD65EtIyFFLLtMU0b3whvLEcCb
	2ivyB94Dp1YyFj/mQDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnrL0-00Fl71-0X;
	Wed, 04 Oct 2023 02:10:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnrKw-00Fl3w-1Z
	for ath11k@lists.infradead.org;
	Wed, 04 Oct 2023 02:10:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3941r2nn012034;
	Wed, 4 Oct 2023 02:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ydS1Nsdr7hBbmTEYNr5SVlkkXTsC+jI1AZ+rHqokxHg=;
 b=LGqnSaMO97NhSsPLFxmzjCcbXktjiadiB30cD83fhRxUd1W/OUajX4QGhMoyMHWkAK6K
 wdGQEm6nhuvivck0SfASb2jEde6jWsbR5A29xF0aBQXqMSxenBJuZOeuD8MHY2ThJx01
 k3FDBIqmqP4ntR3La0tTQQvPbYIRQl1fLpL0O1hW+SYTHojndutbM6Wn1ks9rZtw7kQA
 Dtm89TMnHaYrFJ6b8g0AqFeRWzE2XpPHfyBqN5sctTmYTkYocL++OkmE/+YQ9HQbfmHT
 XK9QvrRpjGn/bag8x5VOkfWxhHVHquKZ1IPSoUhxHAai/HP2n5RT5UAZ3jOc7b/ELrR+ bA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgr9mgr2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 02:09:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39429m54018949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 02:09:48 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 19:09:47 -0700
Message-ID: <735c1318-2a6d-4247-8220-868f63f08578@quicinc.com>
Date: Wed, 4 Oct 2023 07:39:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: ath11k: fix Tx power value during active CAC
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230912051857.2284-4-quic_adisi@quicinc.com>
 <169634351476.120947.13624704208026863471.kvalo@kernel.org>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <169634351476.120947.13624704208026863471.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3XI6ERby30MfBK6Yo1pUD1ICi7_nkY7C
X-Proofpoint-ORIG-GUID: 3XI6ERby30MfBK6Yo1pUD1ICi7_nkY7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 mlxlogscore=803 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_191006_696647_0CF45A11 
X-CRM114-Status: GOOD (  14.59  )
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

On 10/3/23 20:01, Kalle Valo wrote:
> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
> 
>> Tx power is fetched from firmware's pdev stats. However, during active
>> CAC, firmware does not fill the current Tx power and sends the max
>> initialised value filled during firmware init. If host sends this power
>> to user space, this is wrong since in certain situations, the Tx power
>> could be greater than the max allowed by the regulatory. Hence, host
>> should not be fetching the Tx power during an active CAC.
>>
>> Fix this issue by returning Tx power as 0 during active CAC since it
>> is known that during CAC, there will be no transmission happening.
> 
> The returning as 0 doesn't seem to match the code. Should I change the sentence to:
> 
> "Fix this issue by returning -EAGAIN error so that the user space knows there's
> no value available right now."
Oops. Looks like only in commit message its still zero. Its changed to 
return -EAGAIN in code.

+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		mutex_unlock(&ar->conf_mutex);
+		return -EAGAIN;
+	}

So could you just rectify while applying or should I resend?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63003C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 03:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVodSqE4lSQpUf1pisRrJ6/e7l8fmK5UcTZZ5HDCU7Y=; b=2pZFUtOFzf62pq
	hDzKxqJvp1iW/71kzukjjtqX10QoSkHccKASlioCWBp7ytHECKfgBXUZ2216aTacaXksTWqHStn7X
	HZO9EUc/s7MyA+qcKU3fcyLL/JKi7Ny78kCxvorBInG5d+tA4AbPe2O2ZLa5dJbnmXgaVYfS9xC5/
	qyvhBHf2yG/SOejYr/cwJqMdZZ5JTkwLASO5GibwIKt/zD4HDsuCz3boVuXRnxcS1d5Lx2LNvtEr8
	WoOP3xSSACLQGcWh6lJf+CbWmrrCjOB0j7D5qkLcvgPpOqkxV+S1tJowh67FMW+8xE3cbOcEHmmaI
	CJ5E9pboOf89wi4b9d0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6KY-003Btq-Jt; Tue, 11 Oct 2022 03:53:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6KV-003Bsb-55
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 03:53:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B3BOJl023795;
	Tue, 11 Oct 2022 03:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M/ulPx5lMLRRg3CDFasPu9OrO7retqKWObnoFd7r1LY=;
 b=cKEJ15f4iojA7uAHZC2gZeGWWdbKO5A9/Vju5GjP7jmyRLn18hC3ssyPpsrGWEBixcx0
 9ZoOc1geJsUZutXBqsC8cJ7qFVahY7OUp1omGSlRPmqTEzzL5A383v4fkz0pBkVc1swj
 ATJUqZfGJHe4st3WkyLMxoEQB4J9S7S2nfg6VS17afB04ZpIJA/xiHTVouafnoE4mwvg
 B7An/GQBMJmyPfq8SAOm2PFdAmOHA6FxxNgfqCvvXdLQ7oe3EyNYpIw/iaO5vUyE4fpe
 yhxnS/KjGCdrF/SFQaZaG+5JsPIT7YveVH3MyHaTBOoZHMpXE8Rn95kTtQ0LQD0yrbhH Gg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rxa0y23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 03:53:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B3rCkn017198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 03:53:12 GMT
Received: from [10.253.78.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 10 Oct
 2022 20:53:11 -0700
Message-ID: <f50c94b9-252f-25ab-4650-bed52762bc4d@quicinc.com>
Date: Tue, 11 Oct 2022 11:53:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] wifi: ath11k: change to set 11d state instead of
 start 11d scan while disconnect
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220928081413.27339-2-quic_wgong@quicinc.com>
 <166542536986.511.1244496445875563981.kvalo@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <166542536986.511.1244496445875563981.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gqjrnhS7kuiDi70YT9mkDYJAW9fApUk9
X-Proofpoint-GUID: gqjrnhS7kuiDi70YT9mkDYJAW9fApUk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_01,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_205319_347921_BD95AAD8 
X-CRM114-Status: GOOD (  14.45  )
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

On 10/11/2022 2:09 AM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> wrote:
>
>> When switch to connect to a new AP for station which is already connected
>> to an AP, the time cost is too long, it arrives 10 seconds.
>>
>> The reason is when switch connection, disconnect operation happened on
>> the 1st AP, then 11d scan start command sent to firmware, and then a
>> new hw scan arrived for the 2nd AP. The 11d scan is running at this
>> moment, so the hw scan can not start immediately, it needs to wait
>> the 11d scan finished, it increased the time cost of switch AP and
>> even happened scan fail as log below after apply the incoming patch.
>>
>> [ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> [ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> [ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>
>> Change to set 11d state while disconnect, and the 11d scan will be
>> started after the new hw scan in ath11k_mac_op_hw_scan(). Then the
>> time cost of switching AP is small and not happened scan fail.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>
>> Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> I still see warnings:
>
> [ 3627.691737] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 3715.435608] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 3860.333214] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 4542.000955] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 4604.018451] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
The failed log is now happened frequently as before, I will change it 
again to suppress the failed log.
> 2 patches set to Changes Requested.
>
> 12991768 [v2,1/2] wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect
> 12991769 [v2,2/2] wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

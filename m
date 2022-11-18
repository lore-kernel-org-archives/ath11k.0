Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9228BC433FE
	for <ath11k@archiver.kernel.org>; Fri, 18 Nov 2022 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1p5+1IOgVqqciuMjlZUBJZEm0H1SCIk6BqxR5tHs89o=; b=PgfdVy6owiZYhW
	FBmdu1AMlmthJMwXJd5DCId1Essp9XkSutSfr5zxWG/zgvjsN1PYp0XZ0Q6f5XJwMzvfgV6MdSbtY
	w6bL2tWQOMXjQs2SdJAmdCtOb5ZNn0gMgLeCN3QBj2foRr4RCTSk2Lv3k/y4+kuDbw7HpxDkyHYwi
	EbleTXVduH6Jfd1fsixAWiWq2ezqvmdbm6hc4iScXJtvAXQZS/ah07G1BuTbFebzTlx5alISAcsI8
	+rM+JIysZZSiyX1Qo3dZX5VBu7YFUnDWpcN9LITl2zigE/OJCQWYE8K4lLHoiOMnrZkBkl+2y6sVY
	95adPCqHcsB6lgGVyGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovycq-003O4C-3f; Fri, 18 Nov 2022 10:29:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovycn-003O2l-9l
	for ath11k@lists.infradead.org; Fri, 18 Nov 2022 10:29:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI9uI9h031832;
	Fri, 18 Nov 2022 10:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GiHEF5dV2KVSqC69lRuMtCY71E0Dcp9oocwYhqMtKdE=;
 b=R1W9wfd32nR5fIfbaY4rE5J+EFs6zcWd754uqBgzlEPGdZ/qekCHRgwOCd/4Fn8rpOw+
 AV26FVQGx/ilZvHjsiQvfSOwhQg7V3XGpqssJjwLDL2qbMe6PuCABh/aho9HpK/QPKuy
 Cdc5Qbl8DNHx+kqQMyNi4fMZGQpphn2xA969kE7SOaP1v3tarzadyXOfL6XHJ+XxIeik
 u5RK5MLaIYHAVmPbeTT0BOgZsUJZHmLz6TA7fKwyXvgOHBcAkyAuKJ3gAM/XVhdnf63e
 hLtRFJyDMZp8k1Iz6DxHyo9VnwGYjvdtYZp4dOldAolxyhk+VzWCqEf26yZLzvZBhGaq tw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0ra9bdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 10:29:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIATQQB028950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 10:29:26 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 02:29:25 -0800
Message-ID: <cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
Date: Fri, 18 Nov 2022 18:29:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw
 scan from 10 seconds to 1 second
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
 <20221011072408.23731-3-quic_wgong@quicinc.com> <8735atg335.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <8735atg335.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KQh0TAfKxqRp9oqshfrI3S-_DLHSQojH
X-Proofpoint-GUID: KQh0TAfKxqRp9oqshfrI3S-_DLHSQojH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_022933_397635_43FC6940 
X-CRM114-Status: GOOD (  16.21  )
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

On 11/8/2022 6:20 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
...
> [...]
>
>> @@ -3682,7 +3677,12 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>>   
>>   	ret = ath11k_start_scan(ar, &arg);
>>   	if (ret) {
>> -		ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
>> +		if (ret == -EBUSY)
>> +			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
>> +				   "scan engine is busy 11d state %d\n", ar->state_11d);
>> +		else
>> +			ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
>> +
>>   		spin_lock_bh(&ar->data_lock);
>>   		ar->scan.state = ATH11K_SCAN_IDLE;
>>   		spin_unlock_bh(&ar->data_lock);
> This feels like a hack to me, for example will these failed scans now
> cause delays is connection establishment? IMHO it's crucial from user's
> point of view that we don't delay that in any way.
It will not delay connection.
After wlan load, the 1st hw scan will arrived to ath11k, and then 11d
scan will be sent to firmware after the 1st hw scan. It means the hw
scan for connection is run before 11d scan, and then connection could
be started immediately after the 1st hw scan finished. It means no
delay for connection.
> I would rather fix the root cause, do we know what's causing this?
In firmware, hw scan and 11d scan are all running in the same queue,
they can not be run parallel.

When 6 GHz enabled, the 1st hw scan cost about 7s and finished, and
then 11d scan cost the next 7s. After the 14s, the each hw scan arrived
to ath11k will be run immediately. If the 2nd hw scan arrived before
the 11d scan finished, for example, it arrived 7.1 seconds after the
1st hw scan, at this moment, the 11d scan is still running in firmware,
then the 2nd hw scan will not receive scan started event untill the 11d
scan finished, and meanwhile, the 2nd hw scan is holding the ar->conf_mutex
in ath11k_mac_op_hw_scan(), it is not good to hold a lock for some
seconds because ar->conf_mutex is widely used. So reduce the 10s to 1s
to avoid holding ar->conf_mutex for long time.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

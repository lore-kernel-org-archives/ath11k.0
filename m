Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8328EC761A6
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liYhNZy83pLPGuK5u72o/PoHF/qVon+neHTK1MFGjEQ=; b=oa+p7rv+HnoEfQ
	CoWfr4kcGvQMu0BrjZrVd+lyYVOwMUIcvL9fH07KaoG4JhJCZCiVZ4qFEYWdYsGukMaor3xXZNhj0
	JmJ6M1kr+96izRz1mP1uR0TBkTara/5Nbksx1KcICF6HuhwIUj6L5A4kG841UMTCDr3MWO1N2z5y0
	OI5A0yM4V5uFxW9T4fErkj7vcfegMsz+9M6rJJt/F8Bzfl/STkEflB7seEcIEi1+k/MQGXqjuglrP
	oR3XkxK92f4+yJM7zdCFp9yqvG1ZwVG8mQxXtoSs8AUEIYlx4giezjmEf7zeYJlycGlYKJBPMoGUl
	m0rgU3U3cr/r0JTwiZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKyE-00FbRW-0W;
	Mon, 03 Apr 2023 14:15:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKyB-00FbQZ-0o;
	Mon, 03 Apr 2023 14:15:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333CcKB0019398;
	Mon, 3 Apr 2023 14:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Swdwi4H3o4lLQ7VaorE+XTSo4Bao7PTADqeFwQuzl9o=;
 b=cMOzehHcv+T5nHjqbTyWcKMmBA1gOgVRrslSN/aXvotOLenci50GKRiMvL+oW5QFDeL9
 qzaSOBSM7QmSwcpXUwM3povB0FEhFeXSsPS0YyatIa7FPNfa7zBMEhpvHRBp0zj1c0tB
 ku/Nxf2b4APi85nS9Hzuapf26Of4CyxO1Tjh8IFOigP1e88GIYZ6QXdqBY3h7QvnhJ5K
 TWWiOQb5MlNWg0dZEudOlX0hTQAs2UYCn3fv1cNHAzRNjMtZHcvzKDleAnAekRb08Blt
 jmd8ie4KPHyU7BK2aWcgXml+DEfqCHMwCSlxRUSMH6A/B+JHmQpBJ8YvQNELWZ5agDS3 Ag== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ppcubmmxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 14:15:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333EFYpg005575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Apr 2023 14:15:34 GMT
Received: from [10.253.35.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 07:15:33 -0700
Message-ID: <e315d6bf-67d7-31b3-991d-e6cb78701990@quicinc.com>
Date: Mon, 3 Apr 2023 22:15:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
 <7872a08d-fe37-a876-713d-c5ec40c1893f@quicinc.com>
 <106ad2b4934efd2f81d51b2e66336954bee7c185.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <106ad2b4934efd2f81d51b2e66336954bee7c185.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ulAUs0akw5v7izUoDSBIxEYob_rrE9G9
X-Proofpoint-GUID: ulAUs0akw5v7izUoDSBIxEYob_rrE9G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_11,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=703 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_071539_293231_3EA9521D 
X-CRM114-Status: GOOD (  10.29  )
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


On 3/28/2023 3:39 PM, Johannes Berg wrote:
> On Tue, 2023-03-28 at 15:37 +0800, Wen Gong wrote:
>> On 3/27/2023 4:31 PM, Johannes Berg wrote:
>> ...
>>>> Also I see commit(8fb7e2ef4bab mac80211_hwsim: always activate all links) and ieee80211_if_parse_active_links()
>>>> will use ieee80211_set_active_links(), so I think ieee80211_set_active_links() has passed test case with some type lower driver/chip?
>>> Yes, we have this working on iwlwifi/mvm.
>>>
>>> johannes
>> May I know how did you test it?
> Just writing to the debugfs file. We have various tests using that now.
>
Do you mean the various tests using debugfs or using 
ieee80211_set_active_links() directly?
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

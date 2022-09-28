Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678B3C32771
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:CC:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HqlvFxY52U8GVc5IUOGCl//gFIlMacUdfG0Pvm7ibRE=; b=v/7WZHlOXVvaI1gpiYVVFP/ClF
	OUaivCtq8tLwB8OcxN2zQ5X43N1WREiHgAzyEKJn0tghiRu3XJT1VQ6whZSrwkKugrAxQ7kr7vq/i
	c9vwhdJzqX6aQv3xoY/r0dcCCeygLiO5+C2liggtcplezSOI5s9lYJnl1+/OIMpgC3Nm2Q++B9uiL
	qox8G4l0lqNH18ud1anRkqNYC4cl5WJOf+bQK0rwfpjelsj/NtYifKMLPnXUMfA2dCiqRnrB+qmTa
	NqsVGZSJZ09Sdh7YEZxScXOuuNW+awNYblO7h4m8UVhizJqk4naptmvFqEbDpvNzYHlEBHyLxl+qJ
	dLF1uKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZ3z-00GvDN-Mj; Wed, 28 Sep 2022 15:33:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZ3w-00GvCK-Os
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 15:33:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SBxnY4012741;
	Wed, 28 Sep 2022 15:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=obeRdzhQRRY0RF4Sz+3Z6xgRfmUfdlwLmml6UOVHXeQ=;
 b=lK8Zumk97WtLAqtf9GL2wdkg3H7Eug8F/Kcsiv1hUimKoBwJJb42NZ0zpi94YjmPvurv
 Q/XAg1N2cg+S1xfHjZgDEo+uwclFPPDVGi8vEEVxOSPqoaYaWLHMmyqRmmqqJbhDkL4j
 NKdiQxZcrooGKnhAUdUFJH2E5uTVQLf9pI2biSRItc8s48agDLQ6nCUGmAsp7b2rB57S
 Rp7SqI+Ta9QXlWg+y0WiXW44Y88aAX69W6a9a282oobc4dpzJAb0AnwmgsnuWkEwvqRP
 QB7mAPr+IaBDHDzUDbIxL2OEXfyyoTdft7Eq6kVK50OlgXnxbqF8zsTlELE3C2Be0QXp Jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jva41jn41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:33:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SFXRPr016956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:33:27 GMT
Received: from [10.253.33.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 08:33:26 -0700
Message-ID: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
Date: Wed, 28 Sep 2022 23:33:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
From: Wen Gong <quic_wgong@quicinc.com>
Subject: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cYdTk8vdQ9ALhRcE8V8pXHehGhUJ0ww7
X-Proofpoint-ORIG-GUID: cYdTk8vdQ9ALhRcE8V8pXHehGhUJ0ww7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=738
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_083328_915185_4F437152 
X-CRM114-Status: UNSURE (   6.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Johannes,

May I know the status for below work which is written in the patch below?
I think it is needed in 
ieee80211_assoc_config_link()/ieee80211_assoc_success(), right?

Extending that to multiple links will require
* work on parsing the multi-link element with STA profile properly, 
including element fragmentation;
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/commit/?id=81151ce462e5

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

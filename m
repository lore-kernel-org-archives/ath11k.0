Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E595FC25B75
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lbfRk8qESQEtjJkQe/c3k41eelBu0guNMtSq6GXh7I=; b=eXngSbxhbQiIYkzXMRHQYgwpKx
	qbHfk6Ghx9c2Ayvd05kgcNCRhLUa7h8m59KvbuSQc4DChb6jPJB8Egr+O+7fhDP3e+vFyyLgqV8xu
	YWJpTBk4CWcX6qdfnWX/+p3+dob6MzNEVMnNt8BSy/PKwCUs+dSu+1VdIam4tJX9jcmKujeL7q5ut
	ZRWdmmH0pk/ZCDbm8yuPbym1q7gfovLM9M7EgTOaCM0YQ5UNMqh2DzTck4Ohd3An539feGlJs+p6o
	DTpbH8mAJGbdGE6kObxJDHZ+XHLOfjT83cTmgOnwGpytbtA97dLuXoHnTjn6YWpV75zDLzYJ4IqXy
	dlHAK1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEDwa-00000000G0d-1joO;
	Mon, 03 Jun 2024 20:06:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEDwW-00000000G0D-03Xh
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 20:06:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453C1HCd014253;
	Mon, 3 Jun 2024 20:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lbfRk8qESQEtjJkQe/c3k41eelBu0guNMtSq6GXh7I=; b=S0ggxyhX7Nw0tkxf
	VAlZkZ6xDRrusKFJBpRaan+TADFiuSb9V7z+vdA2i1bI/u7Qy2alJ8NXf9Qds5VT
	p6Yn1qAuYCQQjEdUFscVlF2MwooKbVsSqQg2p+fwx8UxwPkh987i1N5hhHf/MKZ+
	1KG9HkDx7ff6AY4oAEcqwLQzRncJtjrY3yRJF2AOUyYOm9ZsNeCnoZ75ACLMzVxR
	Caho5mVHBfkB7xwLiG1AtgI4zVSBKMizi72KL/410m9YolJ7JhDtbRBn0Jk2nmAd
	eww5PRksKMPSKNTzrwezPpL9shDvs4TkgPAEdJHEq4GTOZ8S5L2yrqfSpzzqb5n3
	dyWP/A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4d5276-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:06:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453K62wd019041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:06:02 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 13:06:01 -0700
Message-ID: <28ae372d-0304-432a-92fe-b8fa560c454b@quicinc.com>
Date: Mon, 3 Jun 2024 13:06:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix RCU documentation in
 ath11k_mac_op_ipv6_changed()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240531022411.6543-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240531022411.6543-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MpRBb5YDsibw1dbFBCTyjrk0Zu99kY0t
X-Proofpoint-GUID: MpRBb5YDsibw1dbFBCTyjrk0Zu99kY0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_16,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=716 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_130608_214018_60375E5C 
X-CRM114-Status: GOOD (  13.21  )
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

On 5/30/2024 7:24 PM, Baochen Qiang wrote:
> Current documentation on RCU in ath11k_mac_op_ipv6_changed() says:
> 
> 	/* Note: read_lock_bh() calls rcu_read_lock() */
> 	read_lock_bh(&idev->lock);
> 
> This is wrong because without enabling CONFIG_PREEMPT_RT
> rcu_read_lock() is not called by read_lock_bh(). The reason
> why current code works even in a CONFIG_PREEMPT_RT=n kernel
> is because atomic_notifier_call_chain() already does that for
> us, see:
> 
> 	int atomic_notifier_call_chain()
> 	{
> 		...
> 		rcu_read_lock();
> 		ret = notifier_call_chain(&nh->head, val, v, -1, NULL);
> 		rcu_read_unlock();
> 		...
> 	}
> 
> and backtrace:
> 
> 	ath11k_mac_op_ipv6_changed
> 	ieee80211_ifa6_changed
> 	notifier_call_chain
> 	atomic_notifier_call_chain
> 
> So update the comment to make it correct.
> 
> This is found during code review, compile tested only.
> 
> Fixes: feafe59c8975 ("wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



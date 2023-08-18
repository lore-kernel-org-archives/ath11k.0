Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA69C71150
	for <ath11k@archiver.kernel.org>; Fri, 18 Aug 2023 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZEbykRdpojvMZMVVLR1sihGQwBmzLbhOyvTaebO0AI=; b=IcjkoJQe0LJ9Hm
	lkg3qW8J6uHfigLJryF9TE795Xk0Obt+GUUNi2e+7jcIwd8YpAc127jYodpVJO8ExW7Z2RGJPm9Lx
	Qx7c8At9jtH/vcyIHVEaIo/lAS/Ypqkde5DqgGmKlT3UeZuhkAyOFRXYuOevgGeMr6qC33M4pdutG
	xsMtt6LmBn0Zjl8Rf+wKzzzpvUTIxblzxpN613Zg3L66d6Om3JwTo7ByhpEig8smpxm51KBBCb/qn
	HeL6XDKNhhmMtd52Zr/J8FRawCy2e5D+30d8aK0fMXI/MjRg5BTWoeekHl8E0cpIqN5frSoLroycw
	fPSI8yBBB/lpCTD2GTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0DC-009TEq-1h;
	Fri, 18 Aug 2023 14:12:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0D9-009TDu-2B
	for ath11k@lists.infradead.org;
	Fri, 18 Aug 2023 14:12:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IDR1bN015850;
	Fri, 18 Aug 2023 14:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=86MEjZGSUlufzLwVXi+/7WIhyC6LLGMjS11NpDNOHGw=;
 b=DlOXbM4d0zCekQh/uiYEXIoTt32ZLyG1YfGcMBnucqdgVZo9mi0Hr2GLOVLpKRvbpf4+
 LoirmCmBOHy4TuJ2AGpF+Ba2FTtMclAhBVRd7DTiiAe3mmtKXCYbTwx/gwwwSzmAGRRK
 rePPHgnDRrqmaYqQnlNMtwXyljxS7JBLal28Th6rDDHY877NY7/vDfl4CDnhRR5KLjRe
 wW4DxoXm9p71r0TGJsOAQ8fMDbvJ9o3Zm/pvZ6SrUVZCEJcK56xR7oqg7Z4JI+GkmMZ9
 yV/84svOSCjhc3DgCPcyHPexqnWS/QIYqyte+yOwx1lIUsnFrB3qBw7et/m6N7oyrzpH aw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sj3g9grfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 14:12:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37IECANM007012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 14:12:10 GMT
Received: from [10.48.241.213] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 18 Aug
 2023 07:12:09 -0700
Message-ID: <ead376cd-7739-43a2-8e47-667d27a2742a@quicinc.com>
Date: Fri, 18 Aug 2023 07:12:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Remove unused declarations
Content-Language: en-US
To: Yue Haibing <yuehaibing@huawei.com>, <kvalo@kernel.org>,
        <quic_srirrama@quicinc.com>, <quic_mpubbise@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230811104413.33668-1-yuehaibing@huawei.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230811104413.33668-1-yuehaibing@huawei.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qv2meP24VQZ6M_lMLAygxm4bTrTUVUdy
X-Proofpoint-ORIG-GUID: Qv2meP24VQZ6M_lMLAygxm4bTrTUVUdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_17,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=675 bulkscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_071223_828523_D917F1E1 
X-CRM114-Status: UNSURE (   8.46  )
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

On 8/11/2023 3:44 AM, Yue Haibing wrote:
> Commit 2c3960c2253d ("ath11k: setup ce tasklet for control path")
> declared but never implemented ath11k_ce_map_service_to_pipe().
> Commit e3396b8bddd2 ("ath11k: ce: support different CE configurations")
> declared but never implemented ath11k_ce_attr_attach().
> Commit d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> declared but never implemented ath11k_qmi_event_work()/ath11k_qmi_msg_recv_work().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

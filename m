Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C8ECAC581
	for <ath11k@archiver.kernel.org>; Tue, 17 Sep 2024 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHWI+rUKYnUBsy4BzvhTEP1okF8ZjrZVvjZntr3p3WQ=; b=IeR1POXhoqHFb2s8LmVmrvxEUX
	+9hX3Bb3X/EE+ZSSU9dJQ/n9ru5xprYviifXUCCS6rfJexVp32RbR1bNJauA6S4KrB3QHU8tnuiCh
	QMtXzP+8HJOibB6LURZ5FT6DacrUlzetb76jVo0YU04ZNiR7ryTFZ09XwuqKRBPLhauEoMvqtJDhK
	8xfQzrZ6QsOdnm2CBpv8mhimfava37Gm5TrFrDWEU/jt8KFZq2f+pAlZJDo+lq7O61MrOaTNqIBl3
	mz7sZWyUdG2VHe2AeJg+PVqYFE9GiQ70cdIJ4MuszSeVrGMFoOl19Lt+MpNDKFu8lEHuzABhTpDK6
	Ukq6xkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZXv-00000006LPh-3mHT;
	Tue, 17 Sep 2024 14:51:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZXt-00000006LP1-2Ybn
	for ath11k@lists.infradead.org;
	Tue, 17 Sep 2024 14:51:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H7ab3x000930;
	Tue, 17 Sep 2024 14:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHWI+rUKYnUBsy4BzvhTEP1okF8ZjrZVvjZntr3p3WQ=; b=kxZfToqx5Hp4zhdm
	hxRRuseIWbg3u4HIBjDi9udYmz4qb8uHMzb7h4e4linRyefhFBzduP9MtOqiDRiM
	Goy8kEqE+/kQ8oTX4PfFhCFu/AhtFUlllL60qU37eI3YGhSboqEufT4F7abFDEro
	33HD/fGZcJk03LFN2ViJm09X5Nkadre0za+hUjQaHIeCf2sJ8QxKAUYSXiRA00TP
	298on30E0W+DSUeZwXH1B/6kJ5i9fbkXMm+JzzG18YZnUXUc2clriz+M03fvTHgS
	YI5kYSPwRWVRPPq085N7BDBcoNQOTFMPUTQTxGEYALdSHgq35VuGat7giqXbumw0
	p0q5ig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jeq33x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:51:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HEpBIJ001460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:51:11 GMT
Received: from [10.111.182.118] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 07:51:10 -0700
Message-ID: <747fa057-947c-456b-b31f-530e8a748f5b@quicinc.com>
Date: Tue, 17 Sep 2024 07:51:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath11k: move update channel list to worker
 for wait flag
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240906033200.472-1-quic_kangyang@quicinc.com>
 <20240906033200.472-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240906033200.472-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F3MR9OMiMztPRZjNDtpjA97Iq4YsyaDC
X-Proofpoint-GUID: F3MR9OMiMztPRZjNDtpjA97Iq4YsyaDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=921 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409170106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_075113_811418_8D63295F 
X-CRM114-Status: GOOD (  14.78  )
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

On 9/5/2024 8:32 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> When wait flag is set for ath11k_reg_update_chan_list(), it will wait
> the completion of 11d/hw scan if 11d/hw scan is running.
> 
> With the previous patch "wifi: ath11k: move update channel list from
> update reg worker to reg notifier", ath11k_reg_update_chan_list() will
> be called when reg_work is running. The global lock rtnl_lock will be
> held by reg_work in the meantime. If the wait_for_completion_timeout()
> is called due to 11d/hw scan is running, the occupation time of
> rtnl_lock will increase. This will increase blocking time for other
> threads if they want to use rtnl_lock.
> 
> Move update channel list operation in ath11k_reg_update_chan_list() to
> a new worker, then the wait of completion of 11d/hw scan will not
> happen in reg_work and not increase the occupation time of the rtnl_lock.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Co-developed-by: Kang Yang <quic_kangyang@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




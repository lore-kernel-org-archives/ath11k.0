Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DECAD20688
	for <ath11k@archiver.kernel.org>; Wed, 16 Oct 2024 01:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoQW4rxoSIDEMzq6xtUEKbdvTgWjsejSjRN4KSpd00g=; b=LA9FQbamWspy3DxU0lvx69jtpG
	oBkaQETmiDB7BJ566n10QlE413x4zg+Qs2RWs0OEoUf0T7uqoxGde5wUrraCxG4KaOyxM0tVp2mia
	/GW1DDeAdANZ4qhDahWF/Jd3DpI+eeqhMqZuxJoKLdVmKgS9EW2Yi3x62/Z+mQ2c1BYxDMV/+UStj
	7B6jfViRiyjiVg03wLvaBv/5DrXcdV5m6+pvVnkgwJaLIacokhk8bvZAae/72NG+hF2tNIPnyZdpm
	YRRgu/t1IRIHv21t6xfuCzuHdwYOAAp/Nw+EiNgM7jNDgtd/CRBD7tSCiTnIP7PaYEnDSSWsjGv0e
	uDJ7wWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0t5N-0000000A9pr-0c1F;
	Wed, 16 Oct 2024 01:44:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0t5J-0000000A9pK-3Xab
	for ath11k@lists.infradead.org;
	Wed, 16 Oct 2024 01:44:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FMkJ3P023386;
	Wed, 16 Oct 2024 01:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoQW4rxoSIDEMzq6xtUEKbdvTgWjsejSjRN4KSpd00g=; b=ALM7foEwvkNy6VpM
	zDYM3ycfPFLq1onFDlQV9eS98fmfdbge6UenMBW0rmm4mweeFF9Uiy+Tf2AMymQ6
	Yc7HEk6S7vDWScs7Wh0PB0UoBCj0vNl/tcnkRzZPeCgGWkIfmEV/Fd0w9A+1one4
	dCdyBZAb7zwiG8qWss1cPdVuVsXXxy7ofM7Y/kor/wAaosuj8lWkcBDLXODLKIf9
	6yLKTCtZ0ahudymDaZ+Uo73BV4x15KEk4Q0KIYjrX5+hPhDBUqnUlgn3bsms6bnx
	SltbHvDK33qs2lUPx1OZJrXWwyPYRsD2iUwMSz5TDiNdRcrZi5DV4xKaqyzALc1M
	E/Shug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429r3ba9h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 01:44:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G1iJEh000350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 01:44:19 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 18:44:19 -0700
Message-ID: <eba9bfe0-93fb-40ef-9829-cceb4b0b189d@quicinc.com>
Date: Tue, 15 Oct 2024 18:44:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] wifi: ath11k: fix RCU stall while reaping monitor
 destination ring
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241008053744.1070-1-quic_kangyang@quicinc.com>
 <20241008053744.1070-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241008053744.1070-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4eE_WYDC6Y9ISKizhDawh1HhtituaecL
X-Proofpoint-GUID: 4eE_WYDC6Y9ISKizhDawh1HhtituaecL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxlogscore=977 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_184421_926998_7E3AEEFB 
X-CRM114-Status: GOOD (  10.65  )
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

On 10/7/2024 10:37 PM, Kang Yang wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> While processing the monitor destination ring, MSDUs are reaped from the
> link descriptor based on the corresponding buf_id.
> 
> However, sometimes the driver cannot obtain a valid buffer corresponding
> to the buf_id received from the hardware. This causes an infinite loop
> in the destination processing, resulting in a kernel crash.
> 
> kernel log:
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> 
> Fix this by skipping the problematic buf_id and reaping the next entry,
> replacing the break with the next MSDU processing.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



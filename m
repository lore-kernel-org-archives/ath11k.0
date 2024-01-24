Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB1AC47DDB
	for <ath11k@archiver.kernel.org>; Wed, 24 Jan 2024 02:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt60USMdObOoWT0BRjdt5td5wv/VD7xHByu/pxxELZI=; b=jlHN4V4cIJ8DK6jubt+WaMM/Zw
	WtrlO0I9aNGz9dh5Ju9epVwuXSfHpZyXaUhsBTjrt17esShtvTm+EjOIxHvknoAchXsV6kEeRmWlA
	/tUWUYRXZecOVLrE4K5NaYD2iJi7TVz7tU9XgPsYOhDdXVgBj8dvHnac5Dp9yfu4VKubpOVa6Snal
	TLE+Sa8bY1CqV5PuAazx3EUY+MinCbQdvoqTFfFmw/QIE1DdRT+hkWZTISjRpxe/Y0i99PJDxMOto
	yF7HwkPnJEFDXzsRyghj7/8YlAokOJlUkwbD16yt5ObpUnkNeg2TRDCZIFWkXvfx4BqBIAiBDUWE2
	/rK8dUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSSi0-0015X8-2W;
	Wed, 24 Jan 2024 02:09:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSShx-0015W2-3C
	for ath11k@lists.infradead.org;
	Wed, 24 Jan 2024 02:09:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O1GC18019027;
	Wed, 24 Jan 2024 02:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tt60USMdObOoWT0BRjdt5td5wv/VD7xHByu/pxxELZI=; b=Us
	Gn6uiz5Redl8kjkZnOkTG42wExrJA7LzWwG8oonyUiELVhu5BT5hLKHrLiRKWR/l
	GUqnPb3bYBwRJzCFtKQd5C46RmF74BsXx5+hUS4YJoSBL7xeruz87dWoAB1dBpMW
	LXs4oa0zBt6tyFfuPe/eyJEXZLqgcwV+Wk4+pc9iSe0815/fTGpNkymUs++4GdKR
	hrvKFoF1bAiJooPRv8l+QaQBPoKe92nNeC3QmLeBnFBXrXvW9O8fZwd/jBfl1zr1
	UVgLa0QpK4jEOgxpzhgp+dEocjBiElL1kj1MSisV0NXMgRNno1hhI/vp4EvqlI6P
	S4276L23c3bS1KCWw2xA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhrghhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:09:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40O29e39026797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:09:40 GMT
Received: from [10.110.18.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 18:09:39 -0800
Message-ID: <6e9080e4-fe61-4de9-989c-b3176cb6f744@quicinc.com>
Date: Tue, 23 Jan 2024 18:09:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath11k: fix connection failure due to
 unexpected peer delete
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
 <20240123025700.2929-5-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240123025700.2929-5-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KQdQ1nr_WtmNhAhJNVGf9iQYe3vk0ito
X-Proofpoint-ORIG-GUID: KQdQ1nr_WtmNhAhJNVGf9iQYe3vk0ito
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_15,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_180942_144106_455091FB 
X-CRM114-Status: GOOD (  13.04  )
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

On 1/22/2024 6:57 PM, Baochen Qiang wrote:
> Currently ath11k_mac_op_unassign_vif_chanctx() deletes peer but
> ath11k_mac_op_assign_vif_chanctx() doesn't create it. This results in
> connection failure if MAC80211 calls drv_unassign_vif_chanctx() and
> drv_assign_vif_chanctx() during AUTH and ASSOC, see below log:
> 
> [  102.372431] wlan0: authenticated
> [  102.372585] ath11k_pci 0000:01:00.0: wlan0: disabling HT/VHT/HE as WMM/QoS is not supported by the AP
> [  102.372593] ath11k_pci 0000:01:00.0: mac chanctx unassign ptr ffff895084638598 vdev_id 0
> [  102.372808] ath11k_pci 0000:01:00.0: WMI vdev stop id 0x0
> [  102.383114] ath11k_pci 0000:01:00.0: vdev stopped for vdev id 0
> [  102.384689] ath11k_pci 0000:01:00.0: WMI peer delete vdev_id 0 peer_addr 20:e5:2a:21:c4:51
> [  102.396676] ath11k_pci 0000:01:00.0: htt peer unmap vdev 0 peer 20:e5:2a:21:c4:51 id 3
> [  102.396711] ath11k_pci 0000:01:00.0: peer delete resp for vdev id 0 addr 20:e5:2a:21:c4:51
> [  102.396722] ath11k_pci 0000:01:00.0: mac removed peer 20:e5:2a:21:c4:51  vdev 0 after vdev stop
> [  102.396780] ath11k_pci 0000:01:00.0: mac chanctx assign ptr ffff895084639c18 vdev_id 0
> [  102.400628] wlan0: associate with 20:e5:2a:21:c4:51 (try 1/3)
> [  102.508864] wlan0: associate with 20:e5:2a:21:c4:51 (try 2/3)
> [  102.612815] wlan0: associate with 20:e5:2a:21:c4:51 (try 3/3)
> [  102.720846] wlan0: association with 20:e5:2a:21:c4:51 timed out
> 
> The peer delete logic in ath11k_mac_op_unassign_vif_chanctx() is
> introduced by commit b4a0f54156ac ("ath11k: move peer delete after
> vdev stop of station for QCA6390 and WCN6855") to fix firmware
> crash issue caused by unexpected vdev stop/peer delete sequence.
> 
> Actually for a STA interface peer should be deleted in
> ath11k_mac_op_sta_state() when STA's state changes from
> IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST, which also coincides
> with current peer creation design that peer is created during
> IEEE80211_STA_NOTEXIST -> IEEE80211_STA_NONE transition. So move
> peer delete back to ath11k_mac_op_sta_state(), also stop vdev before
> deleting peer to fix the firmware crash issue mentioned there. In
> this way the connection failure mentioned here is also fixed.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: b4a0f54156ac ("ath11k: move peer delete after vdev stop of station for QCA6390 and WCN6855")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965C1C02185
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SE0z/3TF1CLRiF/vkf7oMPDhtyX0N4Usv0P+pgvfEo=; b=yahNZDZ7Nhz7t1wrdTrO7Osh99
	/zrxxOGSbmoHc3K+x0k7WUOt8rVmWnbspEBV5Egl8+LvVaAVc0YaNqKEWoCDwCKDUKKtZjKmScK7o
	WHVFv/bdbYDDdpCleCSziFr8sGbzpeogzaCU0r4GKIAoWk7SnVsgsTOlIpup34LYd4n692ozIQUlo
	KMmP6fFBNJamkadsVYmiIeBnJp5T1QPjoySxkCKf7qrxNc2rCrRhPcrL72BopIOsNFoPTv4w7d6ca
	0cvPDql8joiYrsjc+KXemVCf6qla7t7Qm5ExJ7YiNH6ld8PUMqQSbmQ1L61M8LIEMn5IVcsAobzIZ
	HyW2H7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyTO-0000000B2XN-0qih;
	Wed, 15 Jan 2025 08:09:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyTD-0000000B2Vw-1Hir
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 08:09:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F0bhXm002544;
	Wed, 15 Jan 2025 08:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SE0z/3TF1CLRiF/vkf7oMPDhtyX0N4Usv0P+pgvfEo=; b=UlKXb1dzmkbyqapQ
	JsI7N+98a0EtO7hXS6i9NF68ZsOgz9H0MJbX+9l57QM/GDAxn8WAapEPitvK1AJs
	z99Y8KIVN8Tow6x1YEwGyAPnWuCcDXGUihgaRJqOOYh2PWQg99fvQr4dCP7saqWH
	nI/BOFCTM5fGYX1nrEnO/v4cYQA1jqQO8ZH94B/4aLtwFz+DefxwrAEkpshSHAQE
	uKJvg1paKLDlauGEofpeg6MpECytNn3HMltTGUmgFGaH8Gvki+0GPZ4sdWDrulrg
	XgS32ZAXdJCdLJWjYtF3FMXSzUd4N1kwRq4llWYNgYlfC8i7vE7xRjjpo775XJhk
	LMWYuA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4462mkgxb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 08:09:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F89ieO023221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 08:09:44 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 00:09:42 -0800
Message-ID: <3b8a9231-e568-440e-90ef-679deb9f3655@quicinc.com>
Date: Wed, 15 Jan 2025 16:09:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath11k: fix leaking peer->tfm_mmic in reset
 scenario
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
 <20240826014942.87783-3-quic_bqiang@quicinc.com>
 <d64f87fa-aad2-bc76-7de6-3e5056e2e637@quicinc.com>
 <8b2d2ed1-88ff-475e-a4c5-8740591f67a7@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <8b2d2ed1-88ff-475e-a4c5-8740591f67a7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HXJVDl4n6_i9PFcTn5_G1VaPqiMFx3XX
X-Proofpoint-GUID: HXJVDl4n6_i9PFcTn5_G1VaPqiMFx3XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=827 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_000947_469463_5BEF8EA6 
X-CRM114-Status: GOOD (  12.64  )
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



On 1/11/2025 3:15 AM, Jeff Johnson wrote:
> On 8/27/2024 5:33 PM, Karthikeyan Periyasamy wrote:
>> On 8/26/2024 7:19 AM, Baochen Qiang wrote:
> ...
>>> @@ -883,7 +883,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
>>>   	mutex_lock(&ab->tbl_mtx_lock);
>>>   	spin_lock_bh(&ab->base_lock);
>>>   	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
>>> -		ath11k_peer_rx_tid_cleanup(ar, peer);
>>> +		ath11k_dp_peer_cleanup(ar, peer->vdev_id, peer->sta->addr);
>>
>> peer->tfm_mmic is allocated in ath11k_peer_rx_frag_setup() but its not 
>> cleanup in ath11k_dp_rx_frags_cleanup(), which is not symmetric now. 
>> Instead its freed in ath11k_dp_peer_cleanup(). can you refactor 
>> allocation/deallocation symmetric funcs ?
> 
> There was no action on this review comment.
> 
> Do you plan on submitting a v2?

sorry for not manage to respond timely.

Regarding this comment, my impression is that peer->tfm_mmic is not the only filed being
non-symmetric, and it is not easy to refactor it to achieve symmetry. So my plan is to
leave the patch as is, and a separate patch could be cooked in the future if we want to do
refactor.

> 
> /jeff
> 



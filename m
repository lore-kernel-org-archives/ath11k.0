Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9173C61DA4
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:CC:To:References:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jkk1DCfH43Z5j4Z6FTHA0WuvB1UWo24CLO77C+RMDsM=; b=oCuFCPzlvYVzEK
	UlpH/S+X7l5KBhm7siCk3GqLGy0/gOEJ8Kcx0KVi4JTbkKbuvP4vszpqUBzxBbft/35aA3Yw5yQZM
	aCeNpyEorfrABIcCJzjLaZj/dnT+6AKa+q5AvuQMIMCYT+McbAfDxyMQsfW3u+w+vk8HVpPp6I+Vl
	2Xt++xDfr+fzK1Ny20FXOg9l5iWdq77sxZJALwFZdvUugjRlC6IChWDkLPlr/PnEmHdrD4gajvfaa
	TxT8obHP0N9S/U2WE3l1EtHp7vgpUxoD9Jb4FTfMvP5b/QDcECHD/MnNIvMuKClI+6lG7dV86pihi
	dHuXIcd9R+GuTS94BiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTrm-00E2rW-12;
	Wed, 15 Mar 2023 16:20:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTri-00E2qm-2b
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 16:20:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FAUH07017223;
	Wed, 15 Mar 2023 16:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : references : to : cc : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=t0thbpf06Kpdrn1rSYWH3OMixNsBn1UZH6hbYWCS/8g=;
 b=pWSHYVaSx4p+CMASPsKSB8JMY5ccswbw/7Hp1fWLovmFpJjY8Cq4PxzA2r4Se7u9BO22
 5ohQzdinPf95tuup1lPI/sElGaxJEuRy2PujdQJnAPlS/PwGy8FcNVPz5ffwfShzVlD4
 yjUsAdpTSFqf6ImaUK25/UpBj48WrXhilGmhtFI8/Eh2xWqtpcIVOZR9JiRDiproiUHJ
 tXIYJ3dqBPwD1QHpaTyt0eKd7ep/DwP5EamhUUYQz4k6lYSk5jdgZkWGSIOwiZFHAzfk
 mj7xXx6Cl40Mu5h70dCADFv0MTkSH2OVvu0AL5ebgZT/6XCJVKK7YWk9ZtBht6tfDWrT Pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2ck27u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 16:20:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32FGKXbn011366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 16:20:33 GMT
Received: from [10.110.5.11] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 15 Mar
 2023 09:20:32 -0700
Message-ID: <7704d1be-c1c0-f06d-c828-a2da8fb84adc@quicinc.com>
Date: Wed, 15 Mar 2023 09:20:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Fwd: FW: [PATCH 1/2] wifi: ath11k: fix null ptr dereference when tx
 offload is enabled
Content-Language: en-US
References: <BYAPR02MB440521A89F19427CC8536690E6B99@BYAPR02MB4405.namprd02.prod.outlook.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <BYAPR02MB440521A89F19427CC8536690E6B99@BYAPR02MB4405.namprd02.prod.outlook.com>
X-Forwarded-Message-Id: <BYAPR02MB440521A89F19427CC8536690E6B99@BYAPR02MB4405.namprd02.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zeJDyol4l_liIvLlkYKoDIIO8KWtGBxA
X-Proofpoint-GUID: zeJDyol4l_liIvLlkYKoDIIO8KWtGBxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_08,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=921 clxscore=1011 mlxscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2302240000
 definitions=main-2303150137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_092038_979424_7D13D98F 
X-CRM114-Status: GOOD (  12.01  )
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


>    static void
> @@ -610,7 +627,10 @@ static void ath11k_dp_tx_complete_msdu(struct
> ath11k *ar,
>
>        spin_unlock_bh(&ab->base_lock);
>
> -     ieee80211_tx_status_ext(ar->hw, &status);
> +     if (flags & ATH11K_SKB_HW_80211_ENCAP)
> +             ieee80211_tx_status_8023(ar->hw, vif, msdu);
> +     else
> +             ieee80211_tx_status_ext(ar->hw, &status);
>    }
>
>    static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,

I think using ieee80211_tx_status_8023 is a bad idea. It is simply a 
wrapper around ieee80211_tx_status_ext which looks up the sta based on 
the MSDU DA. This means it is incompatible with 4-address mode.
If you can have a sta pointer available, it is much better to just use 
ieee80211_tx_status_ext unconditionally.

In fact, I think we should simply remove ieee80211_tx_status_8023.

- Felix

Thanks Felix,
Looks like the band error may not be present with the following commit.
e5c0ee01fedf ("wifi: mac80211: status: look up band only where needed")

I will check further and amend in next revision.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

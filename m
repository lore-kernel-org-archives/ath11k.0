Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3E9E7719C
	for <ath11k@archiver.kernel.org>; Fri, 10 Jan 2025 19:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3tUpG3fCBodRcd5VzelTr/Lk8E4pks2eY0PVPk02P4=; b=30696qAxxabBHBrCFc0FaFo5Ma
	CD2p0qkP74L6qdnbKDFL1PUeynEuJTCoDQ3YFL8QIkxKauPOsvXQTbKRt3Bp3vrH4gbZOuIEZa9p6
	sBkA2NPopkHC5NlnthCKaDlOZID53w9Wg1iLHgrl68b168ITOQD2WIh/suEsZqF1WkrIFMcdFK4V7
	MGsQbCf91xg0uhCi29U1s0Zp3odebSw8nGM1cEXO74tn5HxKjaR6KDMs8fNkvD9p/NNIQkqpx24BZ
	kXfdfA2TJcFlus7JfDCJfB/d4cAXrLqItd4ZyRtjoF4NBLBCB5NRA2TnpVyOHywb0SEP/6hdoEOOQ
	6WyzBgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKU4-0000000GjTY-1vL7;
	Fri, 10 Jan 2025 19:15:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKU1-0000000GjT6-2Bk7
	for ath11k@lists.infradead.org;
	Fri, 10 Jan 2025 19:15:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACLlDw004194
	for <ath11k@lists.infradead.org>; Fri, 10 Jan 2025 19:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3tUpG3fCBodRcd5VzelTr/Lk8E4pks2eY0PVPk02P4=; b=jEQ0srKNe7NhO/jz
	zNE77bXCQL9IG1i5hAcfZlHsv3cc1SDaXHW0Be/7B4yCiBmtivcvrKvzETGHPIBG
	cNVfT+q3MsIBoRf+jWR0M0UrILd0f+qp7JgceU3M3JOa6kpRtZZct/kjwn43CgdI
	hlKzvDOrkBPiJzhyvfK0R0yD/XfAM21LiWmkEZQ4xrbqKqQlbL7cavTtFkEIGSFe
	R+6K/okLonuc81rFGIZTST0Z/HhFC7C3VXKY4pDtF9mwT3j12onOAZNdiIYWdmnP
	xr9v2cmYijT7wk+6G5NQ4JYYr/djV0Ed4wNMxwLlgJY/L0xZp/vJ3jzNDdH/eu+r
	L3L7pQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4433g0s2a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 10 Jan 2025 19:15:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216405eea1fso45349365ad.0
        for <ath11k@lists.infradead.org>; Fri, 10 Jan 2025 11:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736536547; x=1737141347;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3tUpG3fCBodRcd5VzelTr/Lk8E4pks2eY0PVPk02P4=;
        b=u/kXX1phnKVjLl7r4Pj0XmGZyRcm5xq6pHPLqVthufUDykGx1hf+97ru6PSWMZr2QP
         SkvU5I6f4OLLLYi0XeDMaoohiLh9TCYl/iSuYb+rudj4WafN4G0HyFJ+rZjGLklzT5kF
         lDN80Y5/DPAd9OBMfMb0Dierby1JSaXz/NYnUzzoA9AiikPphFekUGLkb2bbrf8xbSW6
         YGctuvlvKCg8fokySiSL7ydEf52mt4cWedT9tfIPiSnEJisoPn+UW9FnVGPSLknecsFb
         pdNSw09cMcZVd7TkHFUlcIMKMcjp0lKH/G6uhRRXd9hgaKPwnJt0qaqAzBex+rAQAM32
         4ZaA==
X-Forwarded-Encrypted: i=1; AJvYcCUEPppb5JbCYh7mKBioyH7FqgiJLjPFKQZQG29faY8nhTmAbOBpcCa8+uczYCzZYNqZQ7q7oV8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6V0MbJXeW6Ng3NpiQruRp1UbazykGL6QhkZQ7WVliXMZZf8q3
	K7aLzozSZcS43OSZlexysk1bz+BEGyTavDbuIJ62mlkilOjNti+8R0MQqkvujqw/VU5Topgdx+C
	7SyOeby5JRMovi/k/OiXyNIi0ofLJt7R8HbzirOFdaHpJ44oZ59eUsRO//j3R
X-Gm-Gg: ASbGncsGn3p7qRFuQMgkyRjd0hqHvQyShb+7P6qz+7359a0YwdytbuHxzLXpktdWIZG
	W4JCVC4CaKF9sgBrSsq218ZPX4BJFs8NxWWoHPUCn5paqWKGzcztB8NawQehEasFOda0umcpv4q
	KVrKeIRC6iKtINeZAnsonh3LpkTiNWO5DY15S16eDUpcKV6U0C+KDbRb/v1g77o7L1Jm7qhocaL
	jcAdOGi6hqsI2RpjOf8gy4AHN+avzGBRwqAdYDcQWB3coF4YwS/KHjBd0jhEF0GL07iQWCxQwgK
	xVrBrreJPkoYM+tp4bv8FOi2U6QS1I7RHoxGxDqvMbOdVLN80w==
X-Received: by 2002:a05:6a20:914b:b0:1e1:afd3:bbfa with SMTP id adf61e73a8af0-1e88d0a2a20mr21428177637.7.1736536547372;
        Fri, 10 Jan 2025 11:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERTp3UMzOaytbTacP2XkCDmM/hz89bf8ewCdobVbONC+3vUbjRtbY6e6ZAWv5rlUWcOQA6nw==
X-Received: by 2002:a05:6a20:914b:b0:1e1:afd3:bbfa with SMTP id adf61e73a8af0-1e88d0a2a20mr21428152637.7.1736536546991;
        Fri, 10 Jan 2025 11:15:46 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm1907523b3a.139.2025.01.10.11.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 11:15:46 -0800 (PST)
Message-ID: <8b2d2ed1-88ff-475e-a4c5-8740591f67a7@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 11:15:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath11k: fix leaking peer->tfm_mmic in reset
 scenario
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
 <20240826014942.87783-3-quic_bqiang@quicinc.com>
 <d64f87fa-aad2-bc76-7de6-3e5056e2e637@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d64f87fa-aad2-bc76-7de6-3e5056e2e637@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 28xkV0erd2gHfzz7UHNcuCEHu1K-2TMV
X-Proofpoint-ORIG-GUID: 28xkV0erd2gHfzz7UHNcuCEHu1K-2TMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501100148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_111549_581939_0E87CCC4 
X-CRM114-Status: GOOD (  10.49  )
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

On 8/27/2024 5:33 PM, Karthikeyan Periyasamy wrote:
> On 8/26/2024 7:19 AM, Baochen Qiang wrote:
...
>> @@ -883,7 +883,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
>>   	mutex_lock(&ab->tbl_mtx_lock);
>>   	spin_lock_bh(&ab->base_lock);
>>   	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
>> -		ath11k_peer_rx_tid_cleanup(ar, peer);
>> +		ath11k_dp_peer_cleanup(ar, peer->vdev_id, peer->sta->addr);
> 
> peer->tfm_mmic is allocated in ath11k_peer_rx_frag_setup() but its not 
> cleanup in ath11k_dp_rx_frags_cleanup(), which is not symmetric now. 
> Instead its freed in ath11k_dp_peer_cleanup(). can you refactor 
> allocation/deallocation symmetric funcs ?

There was no action on this review comment.

Do you plan on submitting a v2?

/jeff



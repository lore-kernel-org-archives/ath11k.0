Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2E606A32E
	for <ath11k@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8S3NMnY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxIRm7mb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X0W66Q/0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=; b=Z8S3NMnY/W+pNeR1b9uXIZxAaL
	UWuzGhlLS32kAIwnAQksh8ygJTE0zbMUCMeIhrxpKEpccoFefqDXMKZ7tlPDu+fCn2lSm9QixFqd4
	wTr6CcxlZVapWXe8k7YQXfkGREuoKaW4eYIdJ9gHgGomaEFzfgjaLaE8DLC00++LbqpHY4tWjlt0s
	z7OFpjsr4bIDZRX1Hy1yitqwXsR6lDFrEyB01UFVMxoLeZqI9Xvypg6I2Yi6vF7w7xid87ugbqt1k
	WtbshArhjDsFw5ZWLgZUSLGOfHFg60l6VHE76yMyhy+c/QaVAQ3EVNqFoaoKsaCThTrEZm8EjOlsO
	NLs7IR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAHy-00000009q8D-1Q8f;
	Tue, 20 Oct 2026 13:54:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAHv-00000009q6q-1W5A
	for ath11k@lists.infradead.org;
	Tue, 20 Oct 2026 13:54:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAHPF702832
	for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 13:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=; b=PxIRm7mbp3RunCyZ
	yBQ1a8W6CcivEoLinHJu4jxi4YCf4nX1u8FfjVDxCla5njVtR2UGPJEWFjyP0G7s
	wVdktf/kpjXXR7O/FvMozK+QXcBAnFRvv5H3urG+pn81R6zp5Kl/qEt2cSOz7Tac
	5qHZ2GlLxsUFdwZMSO1oAiU98qlx+adlRUHN1qeiadKVRKb7TzcsrkVwc2UBt2ux
	Q8jncPMnfIU+RRnBXJ+igfWHeoR84h1h5JWIaQuNUzL+uBBgri9qXhrJAVT00Ixa
	qCXTji0qUnjizfBlCCrqEqQXSs3FpWVgQRJOAjqav4mNKhdwi1uwe7gOPIiqFFAk
	aA0Uhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stq2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 13:53:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so11421767eec.0
        for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504427; x=1793109227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
        b=X0W66Q/0GesOeUEkEq2zOQ8XtPw052DKS2H3IW3LLCHweEJJmcr0Ju4GSN4PKK8egB
         qxKkaQOf6NgYiEVN1TJaemHzAY4rZ3OzpiC76eJhanGhoUUrC0fNjcdNE+/UUkJNnybG
         +Ss6/XfTpdmoTRQkjYCXjElq+jpvOYkpU7+X4Zn+sMdlOuaHI9zsXiGryWVdDFB/kvTW
         lMk7oEIVZ60n6HIu2D14IcbRWRs0ipATJP5IKhkjSdwA6DPv37qDBD+KJ6WUEkEopE3j
         x6z36dLD2jMrpSWio/QC2fAWGWBwRClNjQV/1BU1SxuO3KiMuRLlD8Miyg4DoRTlkk5p
         313w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504427; x=1793109227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
        b=MbftWXNxWZ+uOdnBZqWvfbZ1Tpf5oL6R8Rxpg+r8VtSgyE3b5uzkBTsmqfg7fQT1ur
         sqR9dEduwXOwnE/P0eUgNWF3ZcbfVVXQbamChZ4jt6o1adgdhM2AjRnmvDfbnSucy1X2
         2GPbboAOwvsTWiLq9i2NfdACef1D535PDC8oHLbBQEPElfZpuZU9W+0mZ5Kct14FnCBQ
         h1ReX1l1xgi0Pmgccec+b3idFuW7WZ8Dyzrru8DPao8FK+9DXd96Lxk3cA6ZJY2QRjmI
         nZwSOopr2dA0+55R+v/wFi4Dny0guSt7xepKIanPZjDDpnBidsEtULKDoz/0Go6MoeM4
         qtxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWNCZ1TTwYtdSKdOmEdfwwWgM1IAO0oC+HxCYp/oD6tYYaV4JXHYASsDKt5/iTAQRMTU8bfyA=@lists.infradead.org
X-Gm-Message-State: AFq9FYLWXnezsKa7CysB1YmS/WY2Q/+utouqShLxdZacwii6m64Blvz1
	cXeopBAA1GRO/gnylxCcnwFMC40uXo6VuB2MHqNF3Tq7tTQZrhHmLkeq00WqSbdWhmsyjp93wM1
	BZV1QAQGyJ15B6IYbw4ULMOSx89366W5lpPlAIlEgobPsh4xOKDD9Nun2/dzOt6DZ
X-Gm-Gg: AYBFou3Vn74E9TdqSmaMvQvvn9UgeGwzjPUOjepIunUX52FpSVcB5TGIcVKw0jAsCIF
	6MYdYYXHMpFVV/KNlye8EhcbLaxhWLvC/3RVl+YvD93zzjaCHdOCrIW6c08h/WoQks+HC1ip4HZ
	cMwsgI6YmORhJrKsWJs9g+zdXGPuU4o6b2d9WVPKBW/NlRmtNYB9p9duOIGEvMgoZgTtvY0j6vx
	NuOuBmP0NdOpu3QGI9+//uVeAvasfHIVrdHTrvA7gKZ03LXhQMZD7zSr57VI6/XPiUdgF3q1TVt
	rPGlUKoTdWlTqjJEKqXIN9egS7teg3z0Omqd/0TWwqzvDEWzNCHiJwxP6n5RHpCTrr1izVjf94o
	GZ2eUcFu3t+yoQ7KBEIKKXECbeYqqy7lHH/J0munH1JEhfqhKHOYchFitAw==
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr14278883c88.9.1792504427028;
        Tue, 20 Oct 2026 06:53:47 -0700 (PDT)
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr14278842c88.9.1792504426205;
        Tue, 20 Oct 2026 06:53:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm49618023c88.13.2026.10.20.06.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:53:45 -0700 (PDT)
Message-ID: <520e2454-a0bb-45f7-b604-62492eb15a1d@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 06:53:44 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
To: jiale yao <19888972804@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
Cc: Jiale Yao <jiale.yao@example.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
 <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX9K3DxvbFTZ88
 W+TyvF6ipUtq1kUBzGU4shn8nFlnZy6T7d1VfSmnCTR2GIhoBMyVEQctLc2n89bh0HLzazCa9tU
 HDQBiSOX/VK80d6cyGmX4x8DIxjlkf9wBKlKl4Hr9upoHLpw6G6CHXrMn119RZkjpz6N9Qadm8s
 WFUBSMlsMZZ8sTg0WkAJp99PSq7CvAZ/dC/teBbJxbDI6mZrVQ7Pb3XVT1LgBPhCPs1pu3aRP6/
 OclBGW8PKkje0i7B/RINJabmspG8J+SKf4n7eWEUDRglNisSswDmy5DLr4Mw+QBA/FiCQWiZ8gX
 Qr4s8CE2TS37VhN5PPIj74/rEuE6jg3Sln+tJrT46oq2DvCerwMtHRX17An/4Y//U9LGVB7JxXO
 n1Y4uG1Y7azylIUmpeAOto98A1hLKo5ey5wIn0So0FL52maHKjpiQsIluMCrV0SNcNARXovK9WQ
 xdY0lj+rsbDa9A0hCGA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad7726c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=A1X0JdhQAAAA:8 a=FdzspUwgXfhqtPi2OHsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ddno15o9fC_kEAVXGjmXtB874EEvWiwD
X-Proofpoint-ORIG-GUID: ddno15o9fC_kEAVXGjmXtB874EEvWiwD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXxrR+l2Ppbh0q
 IRsWShtg6RiduQecS7CGAmv8LC/0kudJRHaEe3tCTbN9XmOAbvFmFTXKtTmlVh99xXmw1fkQbEF
 EGyXnkZC0lIxar80niXlX7cYxIAd3oQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_065359_518452_392F0ACF 
X-CRM114-Status: GOOD (  12.83  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/2026 7:19 PM, jiale yao wrote:
> This patch series is superseded — please ignore it due to the incorrect sender name.
> New one is https://lore.kernel.org/lkml/20261019100506.1915181-1-yaojiale02@163.com

Please do not top post and don't send HTML e-mail since it is rejected by the
mailing lists. Please make sure you understand Linux Kernel e-mail etiquette.

You are close to going on my ignore list...

/jeff
> At 2026-10-19 18:00:25, "Jiale Yao" <yaojiale02@163.com> wrote:
>> From: Jiale Yao <jiale.yao@example.com>
>>
>> ath11k and ath12k consume two firmware-provided arrays without fully
>> validating their lengths. The service-ready-ext parser accepts fewer
>> extended regulatory capability entries than the separately reported PHY
>> count, while the ready-event parser trusts the reported extra MAC address
>> count without checking the fixed-structure array length.
>>
>> Malformed firmware data can therefore make both drivers read beyond the
>> corresponding TLV arrays. Add matching validation to each driver before
>> the arrays are indexed.
>>
>> The four patches are independent and each addresses one parsing path in
>> one driver.
>>
>> Jiale Yao (4):
>>  wifi: ath11k: validate extended regulatory capability count
>>  wifi: ath12k: validate extended regulatory capability count
>>  wifi: ath11k: validate ready event MAC address array length
>>  wifi: ath12k: validate ready event MAC address array length
>>
>> drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
>> drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
>> 2 files changed, 20 insertions(+)
>>
>> -- 
>> 2.34.1



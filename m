Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E8AC54FD2
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G35MmUBxX/bkuMicDAituMu7OjFQoQv2kuSnE8AfJkk=; b=PgLDhLLSjn/sRDQoyu8yTsiC56
	gErNRGuTyLXjIoXic1vFtC4n0jPaybfd/tXApWGxLbh4QdjFDeLWVoo9hxoc2R94Z7RjjJQlcgzDe
	qkj+ZgQFxkT8vx+q5Sm6nyJqStECsEUJc5TERMXWi0k00cbcIeIqauP7fpObLSK8G0wfk4Qg+a6iq
	c42OhnV/magI77DPPdwbu+zUwgGOq00FBfHhCc1wSotMZ6eac8jQVhrfYFpOLTD8IXAbs0kO0PsJo
	ShDPrOOX3T8R+V9ZjhbZKRAnaZhmINUXjmk02VJKiI7fVTxI5yCKtQwc572fshJSV6f5X363lYwVp
	zLjuN+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNBI-0000000A1pn-3ruD;
	Thu, 30 Jul 2026 09:36:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNBG-0000000A1pG-197Z
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 09:35:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8uGUY264444
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 09:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G35MmUBxX/bkuMicDAituMu7OjFQoQv2kuSnE8AfJkk=; b=c/be2Z6qkivzga0a
	5ooVF5UBii1Xt4aESBwA23Ks6MvGE5lyUP4NV3Aeszrt15XmayB2p4lwX9SeJoky
	4DFSNfbEVJA7V/VQulx5dc2FCV8Q5WPjQaZM75hRsXD4LY+LxI8dLMW7uldmLBHH
	NMWF6IkSib/U2i7dUJJy0Fn5q8d9juQtd7O73p4vX6E4sjIyKBcEfKVigh0r2vu2
	v+6FsfSKk4gAiMUfzGKtIBeqd0SICcDeMuxwTpviUSIheKBAtnALUXQ3ET+9+DBi
	ciqWLvbwGs+oX+ykp/mUbGNVv2Xdb1Q7deZMGIG7v1vJy3vH8jlafi8CgDHcIHLY
	n/mK8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3hrg65w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 09:35:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso893950b3a.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785404157; x=1786008957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G35MmUBxX/bkuMicDAituMu7OjFQoQv2kuSnE8AfJkk=;
        b=Ci+0KAYTLCjQDFMS0Fo2P64CwOMBfCP/W86zkdeaKrY/1NDWS8A2qoSAHRbg2TqEKd
         mJ3ZqfbBui9f7//TyUuohYoQCbE95ZIQWXAcf2et2HMMU4uOL5g+Y4M+0AAahYkQRlme
         StGkg69OjQXAJ6sb1fLRu7v40G/8JHHWiE87gKNlzB0GuAf90zVWV3cdury9T0jvFukX
         Q1veCE/V504guGYTlxwryfgTSCtd3v8DgnsPHzlB17yZP913L7lIoYQrU/8v7NCDS3fb
         hN5XMSKI96LeMfs2DzRXhMIPuRWSCjSEQPjdbNJCYRNyb64x9SoQRQgEmGg2OO9AQklw
         6XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404157; x=1786008957;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G35MmUBxX/bkuMicDAituMu7OjFQoQv2kuSnE8AfJkk=;
        b=TiMz4Iuar4NHakLviZod9Dzy11LGkhZkLafh+o44mmtMxO75RdV/g0Cysy2xx2I/FV
         o3FaB2r1LexGkEmFuu8yH5L6+HOYmDc+FbAclPDdRGmcndEt90pS5LrjlgcHJxcrYUJy
         JVDpP3CRab57DpYN0VI8n5Ehwlgz090f8JDFAQwt5V4WPZaR9/JPyduhBtmoh0Z9E9LQ
         jMBLRLnb7kEjYZCbvuUlGmOvrQhtu9Kzjes4dhZQKz8kG2zYaT7lKin83lkRQJJmi8Hn
         YUim49dk9S22D5y8sre6EiYUl3Z2jTZdpcZ7LLjnfINql9c1GBuI5870ereem8oJZnH+
         1NFQ==
X-Gm-Message-State: AOJu0YzMqtQkYJYSAJCrGOp8/izRd3Z9Vn3JQaS44exRUwaMynkCal8K
	OXOs6ub6rNmOnO/lJ2GeU2JqvPh2c36qs+A4tfjcbKHPYV5dSOHlHXEY3ZpOvlOVeIe9WzVY5EU
	6oPeHdcz8nzVvyvOQGi3rMpgLFIywFrKzE8QWsTKlz7VIg7KOE+Jd3tozp6mUiUBm
X-Gm-Gg: AR+sD12wqTguEe1zLgvlU55xGc56lNLevl8qPfylrFUqyqZr5IhHZGPK73m/3At+kgq
	FkbfnprsF6wjswTzg4PMk9ixFf7wckbwpMMAnbpaANvaxfIga6zJmLoA3aCXQSVrHX1EhToLfTf
	NVym8KqToLDWbbw90SW/Alvek3xYwPbO10+UhJu6c0GqYU47MJmhnTUwkS7CSSVPdQCmFYww4SJ
	GSTzJq6fLRMeRZDjZkx9J1QAYipaMUbfsA4GqbI878cleFvqK47xvPr/F6fCK80jzQav/5EyAXc
	ckqZdz/U0aoM4PFY6WhSVLA1FbwyxcayDXw/kDJcyNupJOql920AkDvF6SmQ42H9srXUHtcnr+C
	hlbs2HQem24ULpyK1qlcivkyxJld2vl6YZx8MRPHm
X-Received: by 2002:a05:6a20:6a1d:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c9015ac62amr1505743637.26.1785404157141;
        Thu, 30 Jul 2026 02:35:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1d:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c9015ac62amr1505718637.26.1785404156713;
        Thu, 30 Jul 2026 02:35:56 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm19367836eec.11.2026.07.30.02.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:35:56 -0700 (PDT)
Message-ID: <c4185d14-fbec-4199-8618-8b468ca42118@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:05:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: fix leak in
 ath11k_service_ready_ext_event()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nil2QkWlyPXkqiRCr0ucPgTS13uBk-Xq
X-Proofpoint-ORIG-GUID: Nil2QkWlyPXkqiRCr0ucPgTS13uBk-Xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MCBTYWx0ZWRfX5Y1B9WWgansY
 UK8ZvffJmt9NeAIVEELxIIscKR3PJXAXRRdMBhlOfkCOR4PkeYQIjI+ts1Qp/xHDj/KwHI0omz9
 U7QKenv21oZW9ETJfXxKOAG2yUl7J+EEmFHI7n9rCWJtLOYRbXUv7Iv6A3x/DgwfSFOCSzCDfpZ
 PDcS3/m35vlAnwQn/h6FQS4kRD8TmGn6ojEJ0BUQqGSNjKbsHECkPzohEwGJam426kaJeNfi1XQ
 fT0vTOjrlZZnapebhhN4DM+wl/HNIf2XHPluKN6MNPmTUyrEZipufQ8J333vaaZ8GopuNHPzt0e
 LKClMV7IOoWTXyqZ9YmydiY7bAN6yEFPRv8ZkFkkMSUj/4Lz3Yp4weUMc1rxomIbAs7okyPoK/8
 UhgSmeBVdwY9UJltOHN5IakiMxP+7gwfITErw3LID4TJHU+USK1uR+SIKnI8TrEeHs6vlxhncU8
 6XDz61d6pnEJ/RwG4Zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MCBTYWx0ZWRfX5qxzkJU8yZSA
 RC8J798XY4Y8Xt1leNsdj85Oex2pnEop4Szamv0sT/CMz043jJ8pLswI5tw0pNI2zS4Iczee3dH
 icjeGLOhJChQ1RNv0iMVp0cjkVv7Z+4=
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=6a6b1afd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zvkjD-uMKFsZz_jFwDYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_023558_321624_5A4DB360 
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

On 7/28/2026 5:09 AM, Jeff Johnson wrote:
> Currently, during ath11k_service_ready_ext_event() processing,
> svc_rdy_ext.mac_phy_caps can be allocated during TLV parsing. This is a
> temporary allocation that is freed on the success path, but not on the
> error path. If parsing succeeds far enough to allocate mac_phy_caps and
> then fails on a later TLV, the allocation leaks. So free the allocation
> on the error path.
> 
> Compile tested only.
> 
> Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


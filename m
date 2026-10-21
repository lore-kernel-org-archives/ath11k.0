Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0333606A31F
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XM0MmX2K;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=goC+a4OQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7pVGVLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=; b=XM0MmX2KBGHbhUrLn0m5RjEOMA
	PS0T0722EjJtycTdqRmihXheLeIFQVlX7zaLbK40V3yElRiqMdcVRIqJFQNIueS/0fIt0l6zdHhMc
	cMqWGAe73eUlxIqAfThnvnIfy7AGLo0WfhjrjfUCENe6vI/Pg9kfZWcReZBgYNKpDSzYeYICfjWO5
	HcCuoVHbLSKGmJnxGKQ/8XuSQmP8Ib5oUD+01I761OJS5uGc6aXoYwmDjzZ7RwNAjECZYGuKa/pEa
	io/hLjAtRhbMZylm6Tj0xd2+nJ95OhdLph/Pm48fmd0rXMktIyub+9dCpS1AH/AVcqnhwapiDBO3W
	hV7hJ23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZVK-0000000CSpr-1rAB;
	Wed, 21 Oct 2026 16:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZVH-0000000CSoV-1qYD
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:49:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU0x9682114
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 16:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aScArLj/kav6iD0/o6beXEYz
	xhtPHu8K7/dEbQLRbs8=; b=goC+a4OQMFZvZcJVwwGnrmMdn+Hw/jb8LweDtqux
	Ymthk89zZy8ibRIh2OsnxcuKrtrteBnDQahcx5CYa18x3UcZr7yyPQCWwzPt492p
	T4YwA/ZJowbdD+/HjUTLfXtZbZqN6oMY5kLnanhl9nydCQ8gFT6QbLEOUrTdKdKZ
	IXbxj4mkUZfhTNSqFtMfIKpO+SVuD49VXv76OCFtZ5BbtaJc9PbHBSdTiKYMNUwZ
	OoHe7unYesBmOts0ZNBgz8Aw9214R37v2egEXSs/jwlopYBHSmEKXRaXxOxOQiYy
	cpWgSr7P6W2FfurS3kYLgKvk+TgBQCB+fw16CdWXqluFhw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrxux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 16:49:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bebff9fcaso31482966d6.2
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601366; x=1793206166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=J7pVGVLwnB8z1l1uOOG8s91fM/pmaO0IzPOHh+k997BmufBkf15tFRWHf7P9aucHws
         8FOQZP8HzqMRof2v9ahKsrct3lvYCkKS5YZxOwSFBqN1mLcbmBioPqbzmzvnS9QLq6An
         cIJ6t9SAqSNGlM//dcDZ4KHGW8HOXeqvjoKz7XV0xAOwPTvRvCxnFAAgp/TwwiP2vYJF
         /AV577tnfib/ao8fN/6PDq9zt9fcJffYhHSTM/z1gISOcjAlXW3f0XpuhRl8ByQY74dZ
         YD5Ps9loklALTxbXz/fkHatIu9vmTHx/pCR6ocCeLeUieSkQbnSBMJTrB6wG6vuUI5WX
         2/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601366; x=1793206166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aScArLj/kav6iD0/o6beXEYzxhtPHu8K7/dEbQLRbs8=;
        b=YTFxcF6SXAFQ6gjm78sC9AyEUh6XY91mEot5Jg9zUCZhkEsSKM1dJQtejmj52fvE9m
         WcC9+R98fPdBDKvrttwin1pPQyRgcycXXP29z145pGGmNCQZ6c60dHs7rPLJS3blb1BR
         xPXHi/YAuhy8zeZ/NBYIsmiz5i+MKsqrXUSLuytNFXM98/1lWy9iblURvVw1zdpFUI5B
         U5J/qVarzFR86N+F1m/GtyT6CSsmW+XY1VB6qmK3836fid99AI3bT90uTK90HRcIHRtx
         sc77c2I7EhkiBKDe9J1/Dq1N0dZ0RUQ4yMbWwoS1mC0BNb0BpPRjfEwLzQVmLwBVsPga
         v2pg==
X-Forwarded-Encrypted: i=1; AKwUvBz5xBYNca5C8BJK0VCfckhrn0J2mMCeQJLanwvUjBmEwiF6994rt2EYIevCIrUsl74fXZWaZ1w=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4QA0SDgdGwqgStS0cUOlp74ma3/kEeRpMojV2aflzzNjA+Rme
	zItBLCias2mtovXrrYLSRuWjR3O9Kb2BP5+NqVWecvDKeP9KFSwhK+M1mL6V8USmhSh+TYw0+Iq
	VjPlukBc5Lr9OjFwSUZm2gdnkTfkS74sXJRJXi6sDoRSziQpGwSrNcJaKe3gez3MM
X-Gm-Gg: AYBFou0iVCMYuaW4PRdzBLG1/alo5Jww3k0MElhfsLSiAhthYGL1fYjNiLIL7wSIVCS
	no+4VLw9JBn/NPtOImKHbCm7aeIaPjbtXwdn/HjfJszWQ1ZlB9d6kKTLTgfHZQa7a1nbilLawsR
	w7D06jC9VromHAV+O+uWYzwqrYlnU//zlKnND2xlquYw7JJxRE1IdlwjfcPregzXA4uBCeKfG8O
	9x4N1Fn3hQydi7igtquzf97aHhzs2gmO0Gwye5TpUXjL0gTZA99r6yT5H6oN0RF9KFfryRLhKeO
	1uZJGm18ep7uWJYbg/CMh/uWNA2Ynt8QjJecsI+XVoZCxb3MQ6hEVyUSyn8avFU3ic5SYzCiBNX
	lKzJtTEXh2rpuNFbNczVEYsxlqMFvr5vdS1XuzG1C+yhCyqbv9SM2SHSV06YWeNHLjag83QnaHt
	pjk7Z3qG7SYCBU
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541416685a.20.1792601365679;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:93f:571b:c72f with SMTP id af79cd13be357-93f57f05bb6mr541412585a.20.1792601365178;
        Wed, 21 Oct 2026 09:49:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4df158sm1332271fa.2.2026.10.21.09.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:49:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:49:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
Message-ID: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KVFSeSq4zcFP0UHl4eKmq63VS_JZEINK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX/QXgj/+6EDoB
 WAqzBd6keYp/GJbbWmveUz7OjWupwyaEdXIOvZw6pwMGX8ZBXlAqYaNx3g59y6cSepXAZ6W5tN2
 GXf3JTpeStZHbC3PWXdSfhAllZ/69MM=
X-Proofpoint-GUID: KVFSeSq4zcFP0UHl4eKmq63VS_JZEINK
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8ed16 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Cll3ooqCA_IsHNaTrZ8A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NiBTYWx0ZWRfX0c21JE6eF1aA
 Rnid43oAMvM0JErp3set14xgsJDYRf9IxXcP/bVVJg5zqvF+qt0tvtHqpOvQqOXrXxoArMvshLw
 P0t01zdUCyFurcuGhyA7NKXDK4nKd7THaaBoKMVCbORrPCAeptIW6juubK588Z6+qY3GTM9VVWX
 MRfP6W+TtmDzfpB4Dk56A6D+B1ag+uWKc0i2ZPYjOrizmXncWYuxG1STOrqw1JUmJs5mnnLoDYX
 BvsiU6Mx1j4lUeae/uq5u/mQnOHguKOxxNpkBz+ut/Bw8Cl414z6VT+99sBpMp0XISAwwHluXof
 /Lm4FK5KRpQ6MaDqPv7BoHiG5UOdzgUunpPf9J1jIhiK7htSIZ5xEoGZnLX8ny1cS9OM1Yp+goh
 yx8qQC+T7P3T7eTynYYI2YEamiaTit5Ya3zwPdB7JD6BqqKuFsng1+6IuMxbE0Xkd4HsoS77E4b
 mJP0yttnB4+pmhcKQ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_094927_625044_1B0712D1 
X-CRM114-Status: GOOD (  12.09  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> 
> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
> 
> Please let me know if there are any problems.

"make check" failed:

1. Missing "Signed-off-by: author information"



-- 
With best wishes
Dmitry


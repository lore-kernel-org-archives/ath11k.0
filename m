Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95D606A326
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 01:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KLinmClM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5D/lv1L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G54qloTv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=; b=KLinmClMKA4p0e
	Zc4eBZ1lW4WQ4Weo8ZDtot8Ws8r/p0CtW31eQNCt/zNjr030VfB4mL3fEjciudvwbtvqcyK1PxHu2
	5Ny4LrjF2i6BF7BQDZGSUVTw0xhWASMmb+oPguXspi1zt01uWsjoJ0BIQtNgw00TOrdVEd/AVpXbN
	bj32WOeJ1pI356JN73Ms/3z6RbcHN4K7vJQn/4K7Ivw2tWQKfjjEC+pITSIhIp4jLqGj2FkuORaBz
	ycwwOWrzpt9t+dJZYoCiFSTu2+w/Vb0nS8aHelX8fChf0/RhLkWMfQGaPxiqn5GnHPajA7Ar5vD2w
	5hLdrUwAwvkKTmSCyLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm0W-00000007R1m-1Kz9;
	Thu, 05 Nov 2026 01:11:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm0R-00000007R0Z-2b7H
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 01:11:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oG3Z2487194
	for <ath11k@lists.infradead.org>; Thu, 5 Nov 2026 01:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=; b=W5D/lv1LWTCDzOWh
	0L/f29deMLoESFQnp2yCn5ZVcV0MlX/MEg+e52Nrz4slWpWiGd0Ux7/i3TYnNoZY
	0nJf3OXTs26avJe/rLFJPzvKK1Tqanyo9J/zwafZm3lbJ6M49KgkZgw4VmPqkzgT
	roO9cLBawiAvG9i59upiEQlPCoNKeXo9oRbCopMar2QW5DS3DwK4UFKuTqI+7he5
	k46SMFt3G9EMwsy+WJn+jcSzzI7k9uhmirobk7w/4b+3orKqo/VH1mY7vWYcAJLj
	LSeTdnI3hF12qQ9iScJTuddhc3RbTsOY8tyncbRm6DeAZUZLVYskS4YNyrCYecql
	iUqvAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163kuyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 01:11:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36c9e87d262so1785918eec.0
        for <ath11k@lists.infradead.org>; Wed, 04 Nov 2026 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793841066; x=1794445866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=;
        b=G54qloTv5wmVBBqoxzHtdFa0kCXt8osdevIT6yKHSyGziIUEVl/5SYA10t9RJylKSR
         FswapodTO475TRoFfwqAHrVKjnnxdY2kcDlX65MQhBZKNj6xLGVnQnA1c4QnvXilvQOK
         Za8mKluUry5gi1NUYwZaosAPYGRLl1oWNPxRoG26dMlisneXCdUCmyJV981MiXT22/sa
         Fp2BsKNFUA/UJR7ur/aMBCLXJymrJDgNFvIHmewq2e8VnO5tK8E8xEy6+YkKMRhOSCAK
         bN5YOu7ezDDS7JuVDxNfDgpOSHxPXZQqHzEig1QLa+Sr41teL63RMQPF+P2UV1cWRsQ8
         /CXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841066; x=1794445866;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=;
        b=A6mDx9fHaNwk4bb/Re4z+dpSrvKEJu+qrmaB8PAW9/0oosk36poN4+jd6V1jmfN/FF
         X6vX6w5C3CfcdeKJCqQiND8RiJRFpbewR6QfhIfm6AEGulslRfNE5kFfGU2tYFomu2Sr
         drxuR3SqvJKsszCbiahDRB52Zr4rHS47EhnYcAMILLLnZY0gHSZLUetd+cczPpHDaJ4X
         pA0Ig4LcwlLW77mMhkmqTT3e5yFKczuTKbZVMiyPejxxX5/43c+L9CoAaejTMH/peFsK
         shgjDJIZPaXOa50iRkyq3CHsZIw9hXG8YR2TeqB8oaZkyG/seQmUsZepvccYxqEaH4/+
         6/LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj98QN2/7zG5KsV3w1X9FjVMv8DXGOeGdmDqOa49bFy+x/uWLO+3j4bnzhir/gH0Sdp8Bqh8o=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZW5MUm2bO+96+ZKvXmZcdS2MiC+CU99Z+vg4WvbCSTJn2jj8B
	mblsz5pVvKCbEDI5vm4tmESrng7rBs9N6UA2y2t1w3fm6sB6biuoIVDCIX8jmVOTRWfhcZy29yA
	iKilIdXiIwNUDDev9xy/wRf58xjLLxfDvTxbE3jcX16+KBuS8cbPWQkwUGTLBRWcA
X-Gm-Gg: AYBFou0ggumyFfrmnHmg4Ax02xyXVLsXzX89srlL2dhk9MssxqbbA7xk70uFlOENcAe
	weMednEWJkEpGL/TE+mNLXd1affTkVqRliiZ5hewdOmruXDLWCMVXRHyCuT67J7w+JKtjBT1BIS
	NKIRkwwCxgwLk9Gy/OEjOdhVyUyAGjfkICRqsJcLmu53wkzAvXAD6OjnoyocIHLK7h2gImCHq+K
	PYAVKBWeQJMBpb1pVdQaqAHjgNxndX77pJgp9c7ZeryWgha6xSwKeWYd+3aqNQaSKnc7/xrJNm6
	RaKrCgOx/X7dvPkH6DKGT1HOrFRe12hiOqLhgL8GMqjWRDooBDTUlUg2+wBS2e27dhO/6WnCnZB
	WlBr/vBSU7x39RolbbzaOamaOLSdorDPEB2xa5R/UvcbhKpVvs7XQiJq8jwlq8l9EWiVe5mbcBy
	QwwQM0p+/FNxWJ4GznJdpmJnQ93LSeOQ==
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr25817737eec.11.1793841065647;
        Wed, 04 Nov 2026 17:11:05 -0800 (PST)
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr25817701eec.11.1793841064981;
        Wed, 04 Nov 2026 17:11:04 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm4190698eec.10.2026.11.04.17.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:11:04 -0800 (PST)
Message-ID: <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:02 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20261102
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dIaXa9AJJaco8FWYHjsHcPYphz1668Dp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNCBTYWx0ZWRfX3l8kb50JAIE+
 qXk5KsYrwi2cpFtEeNJRNfmL+GxD5kPAX7oMwJxMnphLYN1PeQyQmPBiGBh/VzIhv5lxInmzFy1
 WemqTitgqiGC3657OHcP7/6/Od4211g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNCBTYWx0ZWRfX0N/lXgU0XmNG
 z6KNHhGuvNEw/22DUa6I6KqUBzrCzH+OImwqheenbTfTUEeJrjzqbUN8T8ckLqwZwkhHxqPCnDb
 jsDFYvU8lVRzf+VLs7I6mOm1rQRb6iNwKDYSrEwlmxTKk0W5hUqgFovGWFp2HVZCQFHUYxJOqBp
 Rbm+l+sOi09lBN+BOjujN/eC5vnheXlQp5E8RCJaM839jjy8//apeGTUFHzv8e9lMDGtJ0oDPQ9
 YrREF1R8e5pdDeaE9kN8JCsn2lmIdSN73++VmZ/zNMH/XLqJdlGvnps9oT/0B3sE8VSWPuSyPtL
 p/wk6Eceh24NxVwZ/7I8N2vGcuGPYM5QOoxki5SECI0/W4Bf4BJhVZfffyPYmtXlDex+vYYv0iF
 ThRnFwPvJ5VoKVmh4mgDwGb0N2YSEpynIwfg9ltNVgFiHOJmYJnX8LDUVLVrVTU7Od84q/5UZbG
 asrH2X0hdA6He19BWOA==
X-Proofpoint-GUID: dIaXa9AJJaco8FWYHjsHcPYphz1668Dp
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aebd7aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=uPsaRaffaKHOGCdRA0sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171108_811667_5BACCECA 
X-CRM114-Status: GOOD (  11.41  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/2026 7:37 AM, Jeff Johnson wrote:
> The following changes since commit 25e73f1d6868c759c8eb56cad4e411692c5341b4:
> 
>   wifi: mac80211: reinstate IEEE80211_TX_CTL_AMPDU flag in ieee80211_tx_prep_agg() (2026-10-26 12:20:45 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261102
> 
> for you to fetch changes up to 83d689bbe8f90ce39961bcc3a64f2ca2ec184019:
> 
>   wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it (2026-11-02 07:16:28 -0800)
> 
> ----------------------------------------------------------------
> ath.git update for v7.4-rc2
> 
> Fix a few user-visible issues in ath9k, ath10k, and ath12k.

Johannes,
I missed the window for your wireless-2026-11-02 release. Since you have now
fast-forwarded I hope you can pick this up so that I can also fast-forward. I
have a series that depends upon a revert that went straight into Linus' tree.

/jeff



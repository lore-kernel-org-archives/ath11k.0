Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B215FC53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 18:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3rrO4b1YlCwMbGr0iVSpzpPHwC7J893woDGbXC19zM=; b=3DwMYMfBJbmUv9/duO4mayjsT6
	g0spxfuJXTXxeYGxFpIJUosJAGucBwJHOiFHY/FUbout/nhlXXPTasd+9dWsv7kipwgSrC0lGIUCz
	Swceg59YGLl8j4RLfZMdYnKgs5jN5P61QU5C4gBrMUGCKIsAAr4yJxz1aQLlUZ6oPFZHlC9iObNOT
	wdu7zCl/qAyPhNlgMPDOVsA04i50eCrQZuzoPtyHleBl3DhvEFWOR3uJ/b5JrEdTkxXwU8gPFQ8tM
	O8dggjD4s6Djs+U8uX+3wklZUbJG2hDYsCOC3G8Ows8XNnRiR/sJ2NuG2pdmc+kN37EwUhM4BnZfm
	dc7OIQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8qI-00000008nN2-0xub;
	Wed, 29 Jul 2026 18:17:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8qG-00000008nMf-1xWa
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 18:17:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3AJV1700433
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 18:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3rrO4b1YlCwMbGr0iVSpzpPHwC7J893woDGbXC19zM=; b=nnaWa0abrzQ3YjRD
	XxtgHa1qaPhGq8KwAtdEacV78Lu9b3CHyMztkvh2wgs9s0CzbuirmiKgwoKVZ0rZ
	o0e46SzRtRrsePNnU0W5iGed++B27fyGWTKTdLGggcDEE4tQkKnxofnqUCw7n90c
	u72V1IV1cTjD+db4QiUcMdF3Yqhyx86wF4nEljAQT8NtzaXUlVWR0Q27MuZJh+Ip
	KyIYgLhKazFqBmmHGMa60JQvT1fi96qyyw9OkFGjy8TeqEDl8j6ci7LQGbCZPIVg
	4GA+k9f0EyhWk1s08wVZtJXcriQjwAD+IL2AFEOrKYhOjJ67NBscZAYLEuzfGiL2
	0i1kKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj21fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 18:17:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1600553a91.3
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785349039; x=1785953839; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3rrO4b1YlCwMbGr0iVSpzpPHwC7J893woDGbXC19zM=;
        b=Wl7Sz/81+kMfy/+hnnjUoN7NkkfS0zdKRBIcmz774/38gcVq5N2yamk3wSG9PJHUP5
         LZIc/eczn4WTvTLg+Mich+TzLOuG3MNd5cwNkH1FXqeEMmdPFCIJ2pIOPeIVU7AZDuPw
         mBlAL6E2bU9WZEYeF7VxpnsC0x53fwVOBF754C3bpWBwqinS/rajJYRunXc44sMZh/lN
         RflzqAf0/TWIFxjIVUZdkW8muMPFT45gX7PVUtCURa/X8RE1y/SiOdB6ug85e3vLOPdj
         6s9zvOIxfTp0AmUSx8Qz0N38npjE9i+aFioq6YDnSjtY/BEmrg52QCjJ8IOo1UdqfXFX
         8rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349039; x=1785953839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3rrO4b1YlCwMbGr0iVSpzpPHwC7J893woDGbXC19zM=;
        b=WEK9lnRVQ3j3pTFEvMYPYFaKvr0WioowSVWJtWw5/95P4nY9DtsRrpJiIntJ8b3pQ4
         gvUH9O3RzHl/0uFslEVl9Q7ml0pAceDwS+gBOQvvOx7/iiLhauRORqeSu8w7CPawdepq
         MwSAPO3zwpwR+GA4OJ8UT3o5UsbaVSYgPvOqOwi+hv/F8Cn9rMoaXO7zxoYVZ5qGQnj4
         Nc2EE7Gw5HH/miENDBExgS7t8L4ArBOUiMvvegvEu+z9J9qv59mCLKDZIzibzS1TRyJE
         NPYcY/k20ZeWmbzVYhe0I3tHm7BsuaxRNEtjdFZa8Z0A75bgZBwaUF8UDUd55EBq0NhA
         2xqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq54p5nDEwrCvbIgtWeZJOED+8ATOxjUMdk76I3CHbZ+1QGpUJTuUQEKs/Pu73Jmgc9RbniQVA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWSTtqGnQQxFCqvGN+kDWU2pQryProgBjXncU8wr2q98jcrRbj
	H9VfGMUAhziwLelSB7v9sCORFZDAjLTBzb0UWMsxWNtQKUFsX5JKKgB9tW7nagWe2Kz+Amny7yf
	Tb40aLk+ktubM7HsJHLAeNNvLGQJylb/P6PhfNP+4cfJxUaxLF3iFnTlaWBfw6ZDKcOY4GspZ
X-Gm-Gg: AR+sD11scQ/2HCtgsnU90LObyP53yrSS+SZAwQ0VMDKjqAxAsj/wMb3KukXJl40+U+P
	MrxzMoeqFUAz/VXcTz6gdNjQQwCdvlHArV3vaB2tyy/YHaLiWAFWfZFdDsk0SGfAQymlY7kBAnH
	2FpU3ahnCwqmTA12jI1XEu/Msx+Izx3ETJQZsrUp7u9l37QXnWQWp0ONHlMyXgDEfaHs06DkD1z
	TUWfhan2W057VbT8FTWha4KZFYD95oeUwAlR51YLj2Y/VokiVvnChK+WDKgA4kJ8TW5JOLwQfYD
	r7jyDa1xAzNYOI5BKBOF17TXeAIB1vH+qqKBO559vO0kiji2ek6Hfe/xfOAj94jL00+t3s89HqF
	R5wzIoTQ4wN68bkWGud3pKpiON6s/euXNrlnp5VFKN9mu7sabshNfBq+/gyN+
X-Received: by 2002:a17:90b:270d:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f6a3da9edmr7069341a91.25.1785349039290;
        Wed, 29 Jul 2026 11:17:19 -0700 (PDT)
X-Received: by 2002:a17:90b:270d:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f6a3da9edmr7069316a91.25.1785349038843;
        Wed, 29 Jul 2026 11:17:18 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm13862189c88.9.2026.07.29.11.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:17:18 -0700 (PDT)
Message-ID: <0d27fca8-0749-437e-9f04-e0c0456d2ec7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:17:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
References: <20260729090254.3487856-1-nico.escande@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260729090254.3487856-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a43af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=stxzyirFE5WNopYhs8oA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: U_eHDjC4gxtajY62BUCTo-nvgN140_uf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MSBTYWx0ZWRfX16+CeCbwRi1O
 upVqRlPJpbKqVntRl4hU8cpDJzZiLoShw9q9tHz9uGqPN6euUkl3T0LVI/3tlbFXkmdpiOF4qNf
 Kvq/wdqEwMgjmpapZfgukzKr7bwmQfoeT+rQVpcbf+8I49KhoP0pZIG0PSzf+E0Vtgg8KDHWTmi
 lOYFQv29822pTijB42KxG6RTFdHqtdBBRRoY2cKHmMXyO4/QWP50plBIGBAds+HL41XSse7MsF6
 YRtjO/XAVjE/Y49s7D0E6gTGeXjtTpwKfR+HNwkB60nT4lVTMxcgtyHTZYhEH6qVYxhq+5/71v/
 BZg9K9mcLCUD5fWH7pe04lx3CzgYkHhDRhbtnIv1RKXMOgb/rbi1jlPh5nLQpb2YU2StyhabXEm
 kSi5dcEh9uIFVVO/Xycz1Qi4go8fzR3QjK+ZEfwT9EPEKXFo1/flj5R2EXQHKnK+H/BJOr9gmW6
 fC4hsabtvAHKj2P62bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MSBTYWx0ZWRfX13984utkKnDt
 +ihwHkDdf+kLOPAFJpLL4ccIJYW8bC+4AK1XHTqjza0VulO7Ig3SMlut2gi1o1kY1EAwIZT5q0M
 pX+bi478hOqdvcflgVlFc1BU2v516Wg=
X-Proofpoint-GUID: U_eHDjC4gxtajY62BUCTo-nvgN140_uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_111720_533006_76CC95E5 
X-CRM114-Status: UNSURE (   6.07  )
X-CRM114-Notice: Please train this message.
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

please resend including all required recipients from scripts/get_maintainer.pl


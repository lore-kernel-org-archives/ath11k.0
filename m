Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C5EC3ABBE
	for <ath11k@archiver.kernel.org>; Tue,  6 May 2025 18:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VjgACMnGXxy3UlT5YxgJrb2cSeHYPLeC1Xee4gzTH8=; b=4NAK2gKmFaWKz8s6KAVseXtwYe
	REfaq9MrwGlaxo5L7TDCskBf+sWDdFbVnf59oRb6MuNqb/BAkRJYgcYZjQM4BpA4dvLmhY0hkyqIe
	iq0gKo718nDE470PkeDpFVWXyGvmersISIcWf5GV8rdndZwkv95Zk1Js92QzSCLTJcpslVBheXQJl
	RXVYpLvBhUwtGfwAoBsP4tdHfcsKgeOFT4xrl2uI/emZvHC5Uy0ZgIYoW/BF3x/EdklFht6ivBxNY
	67+GmjbAefHHQSjpupIx5xKJ1RmOquGmEA1TIzZlBmM9zt5MfI1NHttqcYMYzY9SpIMWOfqHdosKg
	gxznUbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNAw-0000000D7uL-1rga;
	Tue, 06 May 2025 18:37:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJVM-0000000CMeG-3bf5
	for ath11k@lists.infradead.org;
	Tue, 06 May 2025 14:42:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468JVZ6007994
	for <ath11k@lists.infradead.org>; Tue, 6 May 2025 14:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VjgACMnGXxy3UlT5YxgJrb2cSeHYPLeC1Xee4gzTH8=; b=jm+aKk81D9yzSpwd
	P+4aDZBe+cSFF1NF3Zx7gJM3FR6Cs9rjarzoTcGmjaRWYStMzUTYIoKnj2kmTZHs
	vV+R0te18Pw37vbGoYoHP2SmAN9WXe82s+aFqL8mc1y9phhTfl2hBXUMTBWvNxyl
	/aqwGbxEay0HI/BLPNYR5bB6YD0joIQV0FInFDwBaCBpolrEiWaSnqKqiRcVaigI
	xfi9WCxzltMntgZcZyWo6dYBroSVeKkEaWnBR5HLvK4wPc3MsPyREHBUIgm9i3Qs
	Cb3iD6WeBuAvPJpFbza3Svk5/+dHS0u/UtyS2rfMeTd0sPNf22hU9/kvbXob7pYD
	EzVgTw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep84pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 06 May 2025 14:42:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73917303082so3759061b3a.3
        for <ath11k@lists.infradead.org>; Tue, 06 May 2025 07:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542553; x=1747147353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VjgACMnGXxy3UlT5YxgJrb2cSeHYPLeC1Xee4gzTH8=;
        b=MKvTvdir3UX2VQbM1DrkVfku1zvy59Mfu6pxfdJ2VGmEcHE8UFH/HE4MDyNKtrxm5d
         iyzq0L/OUnW2qhB84RPyIsf2yrA5SAMI27LGXIG5cW2gNpQoJgMUjOesf4eej0PdZL64
         BsjJgmkCkXpUdQWa9/W44AmmWmq7sBYKoajcvLev35Q1vEKAZobNgWRD1/CC8eMMWm7L
         qzkHVM2bQCNxRyKCWYhlhEVORMj+Zs6KWM2ABBiew5oGidmUnbTog1dw/UyA2tPN52/6
         vHQQhFkT9eiaQaoSX08U7eWFH9FkSe7G367zqsGilbIzFiHzMslTLmkUKCZZcGiOC9lv
         CatA==
X-Forwarded-Encrypted: i=1; AJvYcCVFD3Yw0v7u0UkeXXrB7Uh3uHVFW5XCCuzIjo3br5nHFHdN8IQp3hNOYQFP+9jwbx9rhWOJZ+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCkLhXLjWhEsXZdx+HUuQpciNFQtkiV3r5tnxVHzN20dMlwFwx
	yUzFwsSRm33ruqPEh9RSO8qeeZV0fSB+A7aNRKKnCIq7zUtxm2KhU7RWoeVkaLPAhxlWor32FE5
	2FmVgQ3OU4ARnV52p9jyAfU944qIqesLeX87UiGun1uC7KCzpRg0bEHEZdKHP
X-Gm-Gg: ASbGncvFPgrVR3SvTma/PkQikvKAUa26XEKpHD/PHWlJkjbMnAZsPdNJpI9XJorlHpI
	vNbi8OMcZ56yWovbfEccXoqcF+QfJtwUR7z5fF2mDaNtc+2sCoE51BjVd638kvMzXrTDD4RQB01
	nwvJsrcNLzOMEjujcCE9CpkVXPRK9JUL/AlTQ/gnxfSUc6LZImh3/YY1qtBZ9+zIw2d0cRgMe8m
	lF97wLmaa/oO4JWJMKMRExY6hO7JndGJcL6to3i1A25W5samvkLtD+pTE0VdEZBPvIEBK476TSv
	ILXQUXv5KhjAjj3bIBGHgSFHs6QsDr+XF3Fo5ttjhOVQF6FiGyptSxmdVHQVGoWnnr4=
X-Received: by 2002:a05:6a00:2a07:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-74091a937b2mr4842337b3a.23.1746542553025;
        Tue, 06 May 2025 07:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENE7YHnc3ggGxLX9mbaGNGvNws07uOv9xUg5kw47zlhrUsZlSNkxEzxWCz8ioV3P51rTswQ==
X-Received: by 2002:a05:6a00:2a07:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-74091a937b2mr4842304b3a.23.1746542552655;
        Tue, 06 May 2025 07:42:32 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dedcc4sm8989298b3a.79.2025.05.06.07.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:42:32 -0700 (PDT)
Message-ID: <2b85ccce-70c5-44c2-b598-d148358843c8@oss.qualcomm.com>
Date: Tue, 6 May 2025 07:42:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250428080242.466901-1-usama.anjum@collabora.com>
 <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
 <3732e542-5b8c-4351-8e41-f9f0cdeb4643@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3732e542-5b8c-4351-8e41-f9f0cdeb4643@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681a1fe3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=X3YIGVxls8OrOZudXCwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8X3qIuPATwpnuM8VArrkLhfMevqkLFji
X-Proofpoint-GUID: 8X3qIuPATwpnuM8VArrkLhfMevqkLFji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE0MiBTYWx0ZWRfXxm1eUaQKXrIf
 8XB1UfrAsJyG9972w/PxRhgF0qb8OTetjNhL6y0RF6uei8T1i84QaUs7ZRRJ8GZ/oEa7ndBsrmk
 wvOly70YRLIp/9uPVMrFcitSzgOW1Az+PgsU1bFlYZE2Y94fCda+QyzlFtVMo0eT7K9NlJ/ZnqU
 lM1BQSjerZ/anQfQpzzYz/v/2VvZI1bzCMwAbcXdgGzwh0PvvuZdlB1M5Mgp9U+olHDpZbbRfpa
 RY3SUXyoWBz+LdwWNbU7hDq0CnV5KBxfKFPDsnU+5TgjOuyZrRJZgKisWulzaaMPAC9MybCydB7
 hJwiFB+VhfPRZ+Bk11z8N1ydMqs55pZAiVAbSOnWg6YbWzHyYABfoXuiiVF+MIpAXtKb1mJweyj
 jb9Y99W2UMN97QA5WxRDhpFL+3xu6Qg2yg23vFy2dnvPpXPxpL7nC2vrgM3WmAnkF8LVxkHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_074245_022148_D2DBB4C2 
X-CRM114-Status: UNSURE (   8.94  )
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

On 5/5/2025 11:43 PM, Baochen Qiang wrote:
> 
> 
> On 5/6/2025 3:17 AM, Jeff Johnson wrote:
>> v2 feedback was not incorporated:
>> For starters, can we make the subject a bit more specific, i.e.
>> Fix MHI target memory reuse logic
>>
> 
> Ideally I prefer below subject
> 
> wifi: ath12k: Fix QMI target memory reuse logic

Done:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=ec570013de60b8b0bfa3cafd516ba323e6e29a8d



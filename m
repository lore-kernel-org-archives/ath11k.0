Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796FD606A32A
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mKOeImLb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Cof5Kq+H;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGlKndFc;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ID0zzP3u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=; b=mKOeImLbO0e3/6brGBpcy4oGOp
	Oiq1tePZwxrOslc5z5XXzFL6raXjSrfXXmyNpX1tfGwRWbZORuD0QQj/bNv0KP9D6lSJAfUpBA+Fg
	R6qkBaWqQQjMe4K7L3XryzllWte+f+r+Yj5Jc237xMwC8MvIXQI791LIubLvvblFhuy7kDUEFj43u
	rImgUJND2RPiCQ3nNRYDrl7GJI5Uowgn+aixbJC068GDypy6hNkwXzL/wgn4Fg+LDFkdQgn27PmtT
	7NVoPnIU/j9UlxH1unIyi/3Ekvq73+4yQTL8moljhBQmUq4C9BXJHeSth3OfnZ08uWOMIEx34bpGG
	ixFhLmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTka8-0000000A0Yw-0zn7;
	Wed, 18 Nov 2026 18:40:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTka6-0000000A0Xa-0x5h
	for ath11k@bombadil.infradead.org;
	Wed, 18 Nov 2026 18:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=; b=Cof5Kq+Hl2wnK+hvN0TdHKya69
	h2kytVcmFsyyZ9Ul1bx20ZliSG3OygpSCKTQ2DxX9w7nca6eOsB/5QfE0sQW0AIq+af+cwuXSdwSA
	+N4byhEa0NMMhGkhteYGwhIdzQBg3xTmbnkYvwW9Y4P9IyWoGddJBsgZ6skjfPG/55UVSIAS/Mk+K
	TCEO1XrRAifPJiJ9SiOXDY/grX2gOnGvEuKsjH6PEngDqyScF6qwJpymh/UwCldGwOTPeiikIDFEq
	OsUEZ7CyihA25nxghu59uS3qLZ0QklNn1L90PwD7PS7dkISjC5WHfWLcoqfjaWC1aQYrBwLMWzLzQ
	IDO8NwHg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZy-0000000GPxL-3qv6
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 18:40:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHjkpg4034263
	for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 18:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m5cQENhe23m5PgLRsf7Y2D
	PL3GNLV0D7Ho+s5GZmWxM=; b=VGlKndFcWhJ2ohpvncpq2aeIaMNAUK4KBlYATV
	E33UHXxtn6JRnIFvvJeXCOKDy8RgKpPrXTb5mfcQFp7/oiS5LE+Sb0LCioFzLVFz
	XIbeUd4KhOXJHwJ4O5k6qv9ZZ1Bef+GcW4EZAAejgXZ/6Nza79lW/Hm6XnJvl3yT
	v5WVcNeaLp4uUg3kOS5EfvyfUkZnBK8brF1QHXAUyhD6XE9ykXaEwjz8UjKJXoNh
	9BWwDb+Mujz+0yM7zCNxH226RwXTFCMBuUtcgB67u1E5e0AhVx4qx/U6Vfw5fjxh
	3kDur4CrBh6CRuZ50XGey+JRjGNtR6JxJIbW2XU6/2f0kmvA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg0ngu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 18:40:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1095010c88.0
        for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027215; x=1795632015; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=ID0zzP3uzOEFZQ77d9vq1BgwF/bqSmAMx2DDVydk55zYf+tRrCnM36cqkG/OqtLgj2
         ed7krrRqVWkhi9rW95ZlhBRp07pwPTitw+yGJXLIue34JxiJ+ZLBbFZ5nlhN0rxIMx3L
         /8lkca94rlvWuJwrEnLyl+5mko7JKViBLZA+clCIpJRr5QpR2z5Z8ulzzJN8bsYlan05
         AEOUVQUfGX2A7RrRvLleJfx7sEmCHS9k75GFxTmmZnls72JB0aPd6YdwR+9ieSLTIXLo
         FpRIyW7OrY3wq15x0se5S8dj5r3IXOYJhRYflxWqDnUVlNPem/hPFRJjO5+YuyM3OT49
         r80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027215; x=1795632015;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=zBDuCUHZmFWsHbY6WpfQwLzvUgk4AaQS1IALa2Ex7gdrCiG1UF2UQusZVZgotQHRIr
         ve1/4ErHz1Lg/MZ3GxAJb+D8Ys11L2La8uuJeFdfcsEghlOddIAse9UstSvcyB4wePE9
         mE8GSdpToRa5SBeNHUMbOAH/GvyLabI6eV09co36wVrarg7OvpKi7cAb+5PZmiDFvoNg
         VDI1OL67Z5Zsq+twidpP+Njj15g8gFWfHXoSUmIuBrJ8bnsHJaM7+xp4A4zX75Bk3dWg
         9f5jlbFLWEJD/2AcI5jBBZTAN0rlLujqio24raiJD68Wih1MYXK3PsqAFM4vQLY8z1Xx
         Lq4Q==
X-Forwarded-Encrypted: i=1; AL+hErGe/0pDCa0dFSeMRMbT6lXsxCo+x0KPJfz6Nvpjb/vEgG4IdBgkUExFG9NZblxsT2Q0FCGmJo4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9h13LF3DKji6UyLvkWpRL0kGoLs3qxcNGn2PVrElYEwNJJFuzT
	p70riu8RBxiFgXek9+ATegEvUhM/9iGKzXLMq9CdUJ9Hu2p7V1DcQ8lDckl28KjCJDjn8f/ZwqJ
	sYGIOVDs9Mth4fBIQzsxdCUa2Tcxz+PoCVEpp8jAajj+3FtwwBYjIcdEy/Mas0f7cH06PNXLh
X-Gm-Gg: AYBFou3T/Sk3YXOEsNYCziPDd/pgWwbZeqmS8pEFZl4xAU5sqp4voye1u28OgonOaEO
	oIigi22D0XDsZ6CCXJYLFTelQQQteGsR4rCWPx97T+9f04tUfGdB1d8UOFYPy9NyUgeyaNUF3ah
	3VR5L5b5kZ55ax8pLNrZDMHb6YrPaXpitqb/bfQOt/Mhvsy60uS6BeWWhf0S3szjwAmOOJ6+CHE
	e2ycf59C2RfXqTBPkIOF8QqLo24M8ePMmlS1NuwrCWwvzIRCN3B3FQVtehik50L/eZL048TBwFE
	INvFar5ew4IuiRWgLWHVXoY51W8L7aJ67fnG9+bA3KVnLZ5CyNszAbNXIUwbWwjhzCNl8LUd96D
	/lhDJyStyLryvpZaA4fP6/TcIbtlzjyEls6kmMZi+I4d/+zMZiwGLGSNTemCpp+Wv6CACJHKrHY
	qB6xVSSdO1
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050813c88.18.1795027214547;
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050777c88.18.1795027213630;
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm8126886c88.3.2026.11.18.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Message-ID: <9f678c6c-6446-4651-94dc-ff3763b5dedb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:40:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261116
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u0iNFZpBHh-Y9PUf22cs1x7mdtUrF5i8
X-Proofpoint-ORIG-GUID: u0iNFZpBHh-Y9PUf22cs1x7mdtUrF5i8
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdf110 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=XwkA41cYJLgbl9f4RuAA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX6kCDd2GRhTDa
 F3FldFnx06uY+P8FTIFPMDiWqqb35IrbqpY9kXgvWY9FonZgiFIQdOr2yNNdZ0wXtTzSBFz2WHy
 1ts7DbCq5Hgiy6AvZUAoVnqkkfWefPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX1vKO0kI30N5s
 2Y8bFmXfzXE+iDGLFNRWqfM32Gm0HJvMhuSz0NzdUWnekxsLbrUOwyq2f53lv6kFDy0KBTT3Kda
 IG4dNiFHmrEyXpYGSJUoGBS3bWBeQosKP+BYN4oS2QccJ7FDGNwKOY44uKvcAhc5iJZuBabTyT9
 EphOaxT8mlXppKFa1FZrcQx8U/fn3unm2KmP5lXuwdrT0ef44y65rDxI8+m0Vy0zU5p3aGIPxMl
 H7A2Zg0uH9z+Qs6eEYObAOd+e62TnJ06LqN3m0Cybnl98TS0daqIwxwuVC8/2PG0m7MJsqHNXvE
 wT95KNW8olU43e7r9dhTcp04y6Qmdj0Uie2emnX5j9QnKFy5pwWBEnpLORisGQex4FpBAw4YRqd
 PgMkSyKxyN9oCSLStNPSulakj97/BAnIs1t2AjY44c4ABMu0K4fBunecOgahGXOB9FEca11UdQC
 5K6RL0yD8otRhCiX4nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_184023_449926_694FD7D8 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit cb1edd20907e13b058c0d5bd34c9d51b5bedc879:

  Merge tag 'nxpwifi-fixes-2026-11-03' of https://github.com/nxp-upstream/nxpwifi-next (2026-11-10 21:16:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261116

for you to fetch changes up to b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a:

  Revert "wifi: ath10k: Stop unanswered temperature reads" (2026-11-14 08:13:06 -0800)

----------------------------------------------------------------
ath.git update for v7.4-rc4

Revert an ath10k change that landed in v7.4-rc3 since it has an unintended
side effect.

Also in ath10k, correctly report the status of bundled mgmt tx completions.

----------------------------------------------------------------

Thought I sent this immediately after I tagged it, but I guess not.

----------------------------------------------------------------

Jeff Johnson (1):
      Revert "wifi: ath10k: Stop unanswered temperature reads"

Shunsuke Nagashima (1):
      wifi: ath10k: fix status of bundled mgmt tx completions

 drivers/net/wireless/ath/ath10k/core.c    | 1 -
 drivers/net/wireless/ath/ath10k/thermal.c | 9 +--------
 drivers/net/wireless/ath/ath10k/thermal.h | 2 --
 drivers/net/wireless/ath/ath10k/wmi.c     | 2 +-
 4 files changed, 2 insertions(+), 12 deletions(-)


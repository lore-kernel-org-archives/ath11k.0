Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC0CC531C9
	for <ath11k@archiver.kernel.org>; Sat, 25 Jul 2026 01:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEhSsyZ5VkLfCaY4mr94Ip3RTnMNE5khCZZZxAwLa74=; b=48E8hpAGf1c4LNRFatUGyDoXUR
	SNQfYDDvYm9Q8berQFSqxPQTYxYg2yN7DIHOwSBkkyIX76my1ZGu7NnKm9IowdZvAc1EEjiAMd14d
	jTzU4+FPMlhR5C5EMiOBkSmX5A+hxuhnAvCDWbiXmhCerQ2AA+ZXpxJfzF/ERIJkvfqJpEPkkjB+U
	OKbY4S/ejvJXbykwo4GhTjLU3cvBdvrIqpmQGV5XPluLOooMb8AImMoRrMSVpQg37lsAWVqgC+L98
	E6skwCkLU7+Wtnea5h9IVdT4oMg46pQ6gsc7VHsy0BK+McW2XaHK5eXTwVlEXy0E2dJtu/6R092C6
	Ft8r/iTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnRRR-0000000HSu2-0U7t;
	Sat, 25 Jul 2026 01:44:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnRRN-0000000HSte-2lOv
	for ath11k@lists.infradead.org;
	Sat, 25 Jul 2026 01:44:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P0pxJe1623844
	for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 01:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEhSsyZ5VkLfCaY4mr94Ip3RTnMNE5khCZZZxAwLa74=; b=Pn3hkBT1k/jf5WHy
	1FtTlbzyxivH+0Wt6qEQymUj1IcOIAedUAgODBSxrM/dmUCV72KrOseoufu7WJPq
	DhN0q+429sItcYjnT2lviQ2u0IK9+6WhfI7CoHVWaSvvFgaIc1e4fZDgvaadeVtC
	u8V7Hv9fBdZ4de6H8Ookqtg7QwWAobgKRDHJMaP6Txz3mecEupvHEDYwfJdwohVl
	F2Dqf38UueiXyUZ6xxh8s3fqz9xssqQ1Vo7jy8s4nz1/LhAnyqLR6ltiCVBmS7lR
	dlUxDbj2StuMEICWtQAOc6UaPOqzIu/3E/qIhqenrJxdIc87baj44r/8VFubyvBT
	dmJ9Iw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufr3sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 01:44:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84877b362f6so1595958b3a.2
        for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 18:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784943876; x=1785548676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEhSsyZ5VkLfCaY4mr94Ip3RTnMNE5khCZZZxAwLa74=;
        b=WbUJ+qxwipIlPQ/ymi9b1hOPpKPYNJa5ehHrk9rPYIAT92AlstRxseBXanayNrCPPO
         qiWK/6FfSsQqQe96w+QYu8QNQ27sHZRN0FxE0mYHCDiQ1Vt22ldzKVfhovVxl0YNPrqQ
         C5ny19uBNPSZRqlTn7f4uuejS3S97jSgrs89HHZCmJgPFJNf9lUeQZWMbugDHaQ3knV9
         s21Q0f1ryi07qxGHRD/D8Jm1Y5Uh5S4HQLUPEmZcSzkCYcpBZyx3uf94DrE3aKxP7Oif
         zakEXqAvuSf4ID4KpkhAhaQBdGPE8/xhneG+L55ryENqi4eW2ci27deJEiC7W1Fo2/q1
         6NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784943876; x=1785548676;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEhSsyZ5VkLfCaY4mr94Ip3RTnMNE5khCZZZxAwLa74=;
        b=lGcCp+1Gb+8td3idr7holowiE2TD0cWInvYLZQ9N0v/eBYqWPKWGTfU5M1/jW1CM5Z
         xRAP873mwo5lokonUvkbzQoWhQqTap4mHd8dnRFGjkw47y6WRwJ4/g86YTYv7VAocLbh
         KZFiD5rGGK6g9pXlNP2iTzwYF5/FdTDXk7dnDyZsEMclShedQt+eW4okl21GcQoNxTig
         OTuGpFCtEHDFma6F7eiX0uQX8uwntMjCVDKHqWm+ffdVpf0unjnhEkvDM+YpcxU/7VPZ
         X44zKq9a866/5odO1job6eJU5acFcMy1SEdkLHFogXK145eP32IWVfy94d0VO/g7iNPJ
         ltKw==
X-Forwarded-Encrypted: i=1; AHgh+RrmHjSQmONjspWEro0CJHInakHKs+EunpPIGPQxsb0bKcYWfIYtB0DsOsTDPyZKFqJOnTXqGSk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZcLq1ve8Oq0kJSfva2P2UYhxv0xCH+iYsYih6gwiUq+okiNW
	jia07JP8d4D2/wNHeQIdtwYOKccVjiAwWD9aSWIxUwSFhJCCeW8RBTu0eiEweiVqk5YJnWeYELw
	ooHduHdRC6S0DU9g7STOLB8FF3JT9iG05cCrFn9m76qD82F8299hxUYAjSzppTNvL
X-Gm-Gg: AR+sD11I+9BjnCTYYnXyt2bXiVVCNm0lCZpkxiRGDbgK3L2e0ja5vQ3wKZcmtzplUaY
	YlqycQ9+azyE4vR9U7xo68ONYHNOKQxHX0jKH2M8s6dxx9RrL8VLuWM/j7iTBjNrmi42Vo+dtOi
	rtjhBwDxfpP4DqffkgLTf/tBYx8kySEmurOSA6gqgWXp5LV/8DsfLONLA3Deok2kn/FEMIrzkmW
	Sz2YobzCY3fe18RVbZ/s0AgWgCEOT3fw9H2wWFnkq3kBt3P7Liv5q8AVZiwNQl7kgRKKi2QM3tk
	GBcJTNdn7F8tyqmhVuIC/s1k0Lciakw6rO5II5JjQKj3elFFvXKLT0ZgO62xYzCHJrCHQf2aKgz
	RxtTqbeqK+fa7pJcEatrZbHCLTtoSsKdR1dnMjbWymHV8FrqemYmJhxSQ/w==
X-Received: by 2002:a05:6a21:3983:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c67e3bc33amr649608637.74.1784943876117;
        Fri, 24 Jul 2026 18:44:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3983:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c67e3bc33amr649584637.74.1784943875574;
        Fri, 24 Jul 2026 18:44:35 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm3989098eec.28.2026.07.24.18.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 18:44:35 -0700 (PDT)
Message-ID: <c085eb61-6b2d-4556-bc38-4454959466a6@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:44:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260723013818.393470-1-zhaojinming@uniontech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723013818.393470-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S1fiNcv3wLAgZ12SbWZvTreYZ-Q2eN8y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDAxMyBTYWx0ZWRfX5MnuPWduM3Xt
 row9v5dLXY/sGy6puZmE6zypSRM36sLjK9egRidZ1ADqMb4yB2y7c2ywS+msICsvc0VCHD7yLeM
 dWF5a1lz1u3Ymu9lViuOykE7ErAxXPQ=
X-Proofpoint-GUID: S1fiNcv3wLAgZ12SbWZvTreYZ-Q2eN8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDAxMyBTYWx0ZWRfX1GYltDlmlk5r
 OtqfTmDXOrgC7flYaU1M+45PBKp1EiTey3zuao+McjSmjQHqoVnVlP2TXDqtvja/VZu5KQn7AZg
 PUepwy4BboK5U+jVlV98ezrz1qH0SWHbjuYEU25PdjtL9J/LnB8eghxoVzDZLDDWOPqRq4+BNmE
 oCF7/WsUrBy4zGylbqYHzxtv8QnHgsblA/dZCcrQfv64giukNsCpdd0jDI+60eKF9l+k6inXRNu
 vqHW5JepO8RAfB9chb4yZ88yu8cGZTWN2OaqhrEIOr9DEXiPWe9faDw1ARtMVc1vdy0UyNcHB0b
 kUYER2Pq9ElcKP3SSrj8MitYvP9DIDKr1ZEnaMXgSXplbjYFdC5sxum3CuDHoG4Mn1n2UrnrZYd
 JewkK5FTVYtEi9agml4vcfkfDx1fyiOx6xgEYekfp3488RXPi4fQOgP1reZ/aad/1sKWbOYJIAa
 tEXYGWMMaiOwTxcrV+A==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a641504 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=blo6l0yq89oDT-NQHXUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_184437_735017_D5C09697 
X-CRM114-Status: UNSURE (   7.93  )
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

On 7/22/2026 6:38 PM, ZhaoJinming wrote:
> +static void ath11k_ahb_free_ext_irq_grp(struct ath11k_base *ab,
> +				      struct ath11k_ext_irq_grp *irq_grp)

checkpatch says:
CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

No need to resend for this -- I can fix this when I pick up the patch
(but if you need to post a v6 then please fix)

/jeff


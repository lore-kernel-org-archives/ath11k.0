Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827C3CC6B34
	for <ath11k@archiver.kernel.org>; Thu, 15 Oct 2026 07:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=cZKN2v8dsV9HZ/IDuLyjne1nRd
	AMz+FQDt8xgwAN5XjTpLLZLwczkeuVa7E15IQXDEs8S6hDdQClEI7tVjfV4tM6IqnjKvHJIcY0YYp
	EXT/IYSzMyd23Z5iRm3AC5CzchtDc921VYd0rmMzlcHjrrSW/cw6fu8ExERnMaXvRwmSRBrAb7CO2
	UXTp2aDykRoUT6swB0XHdnZvbaPL2YSFBVIwjCBr0IlXsgQNB0kI6DLoiYVG9gcbwm4VJXmiEupR3
	ERH2h/1DFm3vYLPEr/vmzf1EuRyucuMGJx3WVdNRiA3Yrn2XOV9ZZXiDD7zSG8oq+UK1H+5sddWiI
	ZbQsLLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGIS-0000000H5JP-13n9;
	Thu, 15 Oct 2026 07:54:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGIQ-0000000H5Ii-2LvH
	for ath11k@bombadil.infradead.org;
	Thu, 15 Oct 2026 07:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=Ln4Xq4Tq0dTfalO7L9vIugiKiw
	CvT4YPjvl9RMkGix92ftH6+MU8+5mFTsTDNwrIcivZ6j0jlCr8L9ELPKQ5Fg+dYzdhA2vrTkf3QKH
	oHeKNrhAox3ktWfJEC1p7IZybx7f9k/MvDxaPsBKckhwRtz8W/x4Jq5Ozs3g2vT26qmgk4CYUNbm/
	tCIGrr/2LVGL2jGMxtbYj43Hn3H83f+kiir3ikuQTSArn0lxJF5jFQ9G+YSjRmRCmQhXD2r4zTlMy
	ufMiMeAB7FHZrDfWjy/j5VidUNSqvp5C15VaM8WrgOxJQJYgdkTffuvahm88jH64AUjjYjhwP9O5r
	Y+vyURwA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHGIN-000000003g2-19lV
	for ath11k@lists.infradead.org;
	Thu, 15 Oct 2026 07:54:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7pnqY1707333
	for <ath11k@lists.infradead.org>; Thu, 15 Oct 2026 07:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=BUOJCsjsIAqYjHJI
	AF3wypISTszN5hD+N7W+fcozerWK14lPAXXETxlWb11U5SEVyHO/pcaU2dDcBtfb
	L//nsOQN1X4j1tSgtPbLKcSMbS1eg1p6CmFKJ9BgZ8SgrbHrqEGovvgNS0GszWZW
	K/jrfOmXFu0hg6JvTfXD64s5h9xg7X6BNtG346VVjeHhYMIrUJEsoP0JwsITp6xi
	9tha3OXTg8lKiWDA/TM4hikFaMe2MZKqZ/F4uPgLGVnMRmgtG/JoPRpCQ1uIY+IS
	hIKCshKsh179sXkZwBMGuPNbFnNziTtXIEWzd+R+CkWS9PncY10GOsjoq/BMKATA
	bkP3BA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sc3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 15 Oct 2026 07:54:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so19100395ad.3
        for <ath11k@lists.infradead.org>; Thu, 15 Oct 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050872; x=1792655672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=JKKVvm3VMgy3jzmJFN/7K3VSOZNxycCGPANNn51QT1wjrc2L/9nxYToiN/wJy1V/k8
         /yBaqa0V3zP4b7aJm0Mtbar4swSh+/iw2TAZ6ZUKQC/3nPT4QB/HQ2KQvtQ8nqvOiaT9
         aaLJE9pUdtX4+hfrYKmi3A9Y6mur/8eW5/Jf34Squ03uvxVq+KuSAxj0+pPAwjC4N14Y
         Onx9RqFYL13lLbphoE6ZqtfRbPKL62sAREshWmUzuNcrupiBW2JNc5wR7LNVI35Ie/4D
         MwAJi1ihU/xGIxe6p7LGakTavnYeNfprUQCmRXAZnfAuSc0OZAdHCjbEwV4LSMQJvPMm
         er5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050872; x=1792655672;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=oadvDj+4LthqTA7JoQVz9th7PDdlZDskpS9q4+pO1K3sTYEQVhgQ1ljThkWhJHeoT3
         A9hDqOcNmyNeSzmptaAEqsfBAeZwzMfTDT/hORP99FGkB+tNDlOsbGKLqFZrnR8j/tuG
         p/Ewl4Jk/ZwM5fN1UcfW+lVwphGv+67sNHdnyTYG09fIf0rB9gcYaX+MSpUCEzZ7/2jY
         MXv/Yt8ZUuhRnKQ85j+FWKO/wyWKwHXSK9vPFZ3mbxhoDgBy2pPl8Ydz+44uMxFDEzjW
         vVYvcaJdsWjsXMLg1VpxAZrQY5M+iOlLX/DHcAV/Axes9nST0mfn5G9rfaO9obKvFmrR
         QWLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxopYbiIe+SGOPtnPdQGdIhBgzdFdmczFfAJWfIawkOLzQIqH5vbMyXOza4El3tYaiuMEsffFo=@lists.infradead.org
X-Gm-Message-State: AFq9FYJdgkLF6W9Bd1y9nsV2/ALdjmOOgZhJtrm0C+V5UfTmoBSU+nza
	4z1rgKGQWDXy5b1yvvhL65x8UbtkrQJoun1rC/9o2nyfsxAAq01SjiL7SGMXeM1BTdqvZ4UNkKl
	GoErByY43IEWOzoYUpMmu4o+Y9hUCV+cwoDAnHiX5LTImNGxCz83/Fv4ikZXnnjad
X-Gm-Gg: AYBFou1PMiAWjRv8Px95/uMi2LAoYgEycOGYrqFtbxjfe1i6kmqbTfXgZM1TQ5vPRfu
	scUo01y3X98j+Fs3IQgC8pde/mkaqFX0QY2ofeCmWLkQ7I3tUtmkKfpp9k+zfZ6K16yXzUhhL6S
	oAG9en+5RRckiXMl/GaGxFRGOQKUQG3NUcZIg4Veq32nWmVvYcXaBWV3vv5ZE05x6vaEjVjWUX3
	CYxyNWnHBz3eHqruV6hrLD6DdgbeWz+s6A0svL+3Oy+Rc2AVIusAoJqbmxZXvsp7iNxz1rRbbJW
	LSDI0oGT7MwI+I9loH6X2Jr45tU/lj6ZMbHLGHjH4gr+9Qma/j2z5eRkBWdQ8PR33YdsEj0BPcY
	EvCt77vrKtyJ9vdPfSJJdeLlMPdbr5labaCcA46DHjIaUukqyHbLMvlSg60Nml1FlwEgGWzJg
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665955ad.55.1792050871827;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665605ad.55.1792050871349;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm76306455ad.54.2026.10.15.00.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:54:30 -0700 (PDT)
Message-ID: <56832d7b-e7a1-49c6-8995-4b17a442e4e6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:54:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
To: Jason Gunthorpe <jgg@ziepe.ca>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
        bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
        mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
        kevin.tian@intel.com, linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
 <20261012144835.GG14213@ziepe.ca>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261012144835.GG14213@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad086b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=n56IT1IzDtYYEsRGsiEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfXxrE06vpyHoMk
 77u6FPIZxt6WlNNQm+dGStfB8BQiALGCuHzLZ8WVgOVVhVfjUn1BBqey5PVjbYMO5x8yPZRMw7o
 agQCaICaFZghK3Z/EiIjh+OhxRsAwmtjdw+3/hkQlCq1q1EIKWvYkAh+6EaIP6xOkh8VQkgdXE2
 kDoutNi5STgUaHipvGPmhO7+z+yyi8rMr7uMp+5EXgcVdmM+NFwSGPXlREFt3epoWv/eH96v0ax
 j3q+I/0LzX3yd3NeYbPimlevXLI0x0l7sqQxxZkqyYOB+nrR5b8phx91kexHgl6Xfl4vtjakw9w
 SYj+CYHgeTG2pUCIXT+GGO+er6Yt2dDCkB0bHFAlE6pjoJWVtGDAtQKKcKg07tPdYGo5WUNkiLF
 rAouZGJLeoBgo4aSj2UPFLsglKbTx5Zhg8MgIeGodgByFyIOogAxd9uNnoxr5/Bx49Sq91JAs3N
 5zNGySVYBoU9/wj83iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX3SyySzMEbCKQ
 IMJpF1R7xJ+MNdyMYdCEGdT3KNg0i1j4gWEIc6Te7QOhNfpUltR5mmhEkXagNBLLVBV1tgfZ+M5
 pyXnrBgJg3dolS7sgJRNTrXOKXu3KWw=
X-Proofpoint-GUID: Vs7rbTL3_wx9hduP41xiyDTXd6HvqaDU
X-Proofpoint-ORIG-GUID: Vs7rbTL3_wx9hduP41xiyDTXd6HvqaDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_085435_880299_7AD25CF2 
X-CRM114-Status: GOOD (  13.36  )
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



On 10/12/2026 10:48 PM, Jason Gunthorpe wrote:
> On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:
> 
>> Thank you for providing this level of detail in your cover letter. I've raised
>> this issue with the engineering team in the past, but I've once again raised
>> the issue with your in-depth analysis.
> 
> The main issue here is the driver can't use a normal MSI-X in the
> normal MSI-X table.

to be accurate, it is MSI :)

> 
> "private" MSI registers don't work for virtualization.
> 
> Jason



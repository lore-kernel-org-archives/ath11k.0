Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA1C9830B
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=eFXG0ThwDI/1R42qw6bkwhLuSL
	E3igJCifLT4xUuDFZ6IQn+PXqoX+NZABdCBzI6xWsvwGOFf4QYwi6LtvnVZH91clbFZjGiw1uMDNM
	tDyoJAS3/fMY9DxlQ9K6mQKl8zpvDzgthmlBjaUlASmcA4biIztfZhkhB6fR431J3WJ8Q9rFj6scf
	F7wDYYBLiuiErC/8Yv0wVhZQ/fmMR1VRPM9oQ5DrYQ0mLwa3uRkY5itzhAqMWMjKO0Tl7DSckyxii
	yA9UtUJxYyl1gqqRiGJNUDAxNxNdbUuv/MRwYZjIz7vYY2rnW5LAYaZhjJv6ym/VgfqyETEXUP0Ad
	eAH3KIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OVn-00000008cYv-3DZZ;
	Wed, 23 Sep 2026 15:03:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OVk-00000008cYH-08xP
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 15:03:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKm6F322352
	for <ath11k@lists.infradead.org>; Wed, 23 Sep 2026 15:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=DEl3D4b/MaQwai3J
	Rc+Ru+AqBDlYi16WsBv2QLOrZss1Lb1ZCPQaal+Sle+OwKskQ+snUYVyT+yNJ01A
	F0EN9a3fIwy+dh6RNxn0j0O97M3Ghajsv9xbNbmZIefIpu6tVOh518WaktBrsTao
	6oeuHsh2TUYpTtNu8TvZJ06p0huj0qVwZHVOIFqNXV2mYmroJ2YVyYD+mNDEY2PI
	WEpk+pNxxufNYo7Oc+PmbtPBI5IaQRShwKSfQVexsbeZpIm5nyFeain6juIhH9OA
	hY3neNnzwcAqrav+o2rbpDeQqiwC+IhDhfPEydTnYmOV0kgpTGZ/E/Bxmx4bY0uz
	XWNVLg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgfjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 23 Sep 2026 15:03:51 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso801061241.2
        for <ath11k@lists.infradead.org>; Wed, 23 Sep 2026 08:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175830; cv=none;
        d=google.com; s=arc-20260327;
        b=r+EwbJBWYXStxLlAzAYhoYxEytW6bVfPer5c50r50C8rfBd/EfEsrCct+RAOZBa0xr
         ydr883azZ8QHq8yh027UvIx4LrkEMxDjnycpnafS4MZhybrRx/Ct0QMu/nIs2lXIsiE+
         TP9eZlA83Y5gllUD6+sO6Ex+EgCZi3Egm6VYOLWvGM9eg3Guowk7L+9ttPQFKjwzh7Ky
         tzwL9+SbgF+sOg/vxFK6EL6crSIZvv6KgVTP76fuVTTzgSeON6GY46bdJWyqhMs21eI3
         RggAFVqJK8shw73Y2RlB2HPLhffsS4TUnniylLS27C2UffK4UazXKNqUEQnYtqxNl89j
         UYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        fh=Pd8H2yN4TLIizxA6iOGcLJLwdxYlZqxWIcQca23F2sk=;
        b=YucAZEMke2zg+1griArP/9DmxSHMZO3Lpvbme5tlmXqTwV/yUdA7bxGb6DxEskiXBe
         YWxZf3j308TUm6lU8/CkDD8J6NLhFh+xsxBJeOXdcwfMPvuFFwXbgAAwUjPgpERSlHuR
         qfj3lzURQmdY0qB80RjVFN5BBENsu2q8FPJg4lnMGJt5KUw9nWLhKmHYpQnEgoNngcZG
         4K8t5/mOf0oR7i0o9zQKVLVD+TG9ho/P+RCVDfr4G9ZGHknTCr3yG14rFC7q3fr5i+Hb
         JWfXhQLK68yA0FyeWyKP8DbWqWd315Rrn9GLIkm5VQkt5ay74Mnl9bYziovQFa/loqDv
         jYNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175830; x=1790780630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=T0kXkBW1QGbMLeA8/5q90J9qkYXrqIBZh2ro9kUuAZ9ZnAAC4y+JwzufvFN0uh77KQ
         +6UO12B6hL4ohW+MnKfbkQ8qxsaZpZ3TVGvbsgXGMyFrkdCRl+NODtJcPwJWEOzLvRNO
         xUQDvHQZtUtLiodQvO31Zr5zTc4/sipSJ3P8yMZBSMvGcgP8Nk3dXt30STonM2XbULnG
         Vas9IZ0kQFUHG2nG+zdsPcLHZPIYzQ0wmS1VLEoyO82/CsaWbHEr1T83VbvVFTHItxjt
         H+4SEY+j66xUnSJe9uIrnLZ5gDPRbBYmGtq4xiPfxsoOqLgvfhwdL7iw0NsHcmQKebrS
         F/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175830; x=1790780630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=VUROqh7Yh7ImZVow0ar3l2ywCFkdFwmggVswBRSrHL54nwQcIr7SC3qRYAmkE7snjM
         bE/MjUse4UZoA6THoTiuzLMWHYeAZAaMRLkQPBGLoR7HPg/45u7KW6BF14MKJghVN7ph
         mVVG/z77jltEub7Q1FHwFgGJudh2GHP9338zwh08VHX7OyQfDTMpQAy5SaLeaTlBhS9E
         NJ7Q9mcAI0cvbZErKWi4z+pnoA6LRxjmpC66mZT4iO8YAEfskewF38k36zjrcPM4tdSG
         QYwH85p59xzexGwjBE1s6fot2DOrmBNOFn92gqRRR/2FlJUgAlUn3iKXc1GvcRnlwnpt
         0etw==
X-Forwarded-Encrypted: i=1; AKwUvBxRoRHoEXJ7flw7PU9EfVnfYsrx/GbIOH3p9iuFy6Mbds1TqCFYkvUKVGt4JjNvH4/zC6QZBbY=@lists.infradead.org
X-Gm-Message-State: AFuF++kbzZTm0f0ZOGClYOfGo4V4WNJpHpevMBZ4JDNK8x6jJiMtrIPx
	TncR3Tv6Cv14wNFtjXdNwU2woreVGPnEYjiZk92sNmaVvw9AnemdmALT+2H65Zmqxu+HirJ1al9
	HTmGUQPuqYK4KX0Yal81uFE631AkA8Tcrx/lBiJp2TSjFEZf+IHz2QgP8pmsI5jUkq3ScwW7g/i
	5Xi3dYVDd0OgLcklLBzK0BJGrauBB27plYNaAhX9g=
X-Gm-Gg: AYBFou2A9jR5crtzmKICXQwmkFmtD5qELksAljYnvImHIoSOFAs38oQ+/n/oWOMfnGj
	xUrwFQm8hy+WwH4B3uBMdZfs1HjZWSh9bfMxWvms80ceicWwbqTGL1YEiYMd4EBjnFrYWcn56ML
	bA+zIkhadIlZqiIUR+5KvLrJ8zUmiIFtBuPfKCTKIMSt3lIkF2DKL/uQCUUg==
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7ac1cfb78f8mr2788545137.26.1790175830222;
        Wed, 23 Sep 2026 08:03:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id
 ada2fe7eead31-7ac1cfb78f8mr2788466137.26.1790175829576; Wed, 23 Sep 2026
 08:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
In-Reply-To: <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:03:38 +0100
X-Gm-Features: AcwNN1Ug9EBugFkjb8PX3BJuksaN57IKAVy35yQBrKwT5dMg_Iz0UHaPN9Wobrw
Message-ID: <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXxDaTPtcOXr54
 g1iY2qAP4jOAlfBc+PN/uRSoLeFZmg3Ew5MjD5/fuOB4uak5Hq8PkG9p6ym4iwxNrudfJ+iqhs9
 frKrc0DYv/DubDhHZdHi1hRhDen2kBYI91DKDgHgA6cx6T3gBtyZe18piOFxJx0baMrixR7XJ0T
 L9yAGkvEQuSPbNqIEf5Lia9PCwSObaIdpf1nB6Kz/2mguk8fuWS/MFlZq4dpRO2KRWA9bejTSbh
 7c0R2gUP/iDm6icF3jQFs4+wNo8fBB+q86WKM1mAaQNPC9Py3w/ibHqqxn/6QYyrxcc9y+TE83e
 bQsI+VsijG3EphvVvtVUUix0U7DHWEONEzdiLbazZM3cmUFXVXGk5G2Ra40OwGNcHN6N3APxTkq
 qkqaYfQ0SqOgnhSyIESwwkMkzKhat47Y0Op38dyfoLoHxaN921dabX+NmLxnZkXOLYtlTtHR0fN
 IQ6XdaSC1ssndT6ywYQ==
X-Proofpoint-GUID: XwoyJKSbJmnv9aFq_cEp185SO1pZXng9
X-Proofpoint-ORIG-GUID: XwoyJKSbJmnv9aFq_cEp185SO1pZXng9
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ea57 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=astPFzNtX3-rckHXrNEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXztA2PLgmHGJ6
 i8oRpJlzqO6bSkp3qMBjcVwzVHtePk6vEI5mg7f3Xl9a9oL0NAc49vtW6xyDZbS2+6mpL6SEKab
 aBPOkx5M+MhNVUM7WVG68V5tH7R7aa8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_080352_200089_EBE8C2AF 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > +
> > > +/* The offset is chosen carefully to not collide with the node ids a=
llocated by
> > > + * the remote nodes. All the remote nodes use node ids in range 0 to=
 0xffff.
> > This assumption does not hold up for QRTR V1 headers where the node ids=
 are 32bit.
> > QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely lar=
ger than
> > 0xFFFF.> + */
>
> Does that mean we have to go back to my endpoint id patchset?  It's an
> option, but a quite complex one.
I'm not sure. Last time I tested the endpoint ID series was its v5 and it w=
as
functionally acceptable, and other than switching to sendmsg(2) instead of
send(2) and sendto(2), it did not require much changing on the user-space
side. But as you mentioned, it was/is complex compared to this one.
>
> However, what is the likelihood that serial number would clash with
> these host node id values? Maybe just adjusting the comment could be
> acceptable.
The chance of collision is slim, but still not impossible.
I think a solution would be to treat qrtr_host_node_id(idx) as the
preferred id, not
the one that will actually be assigned to the node. And before
assigning the nid,
we check it against the radix tree, and if it exists, we try to probe
the next available
id (so an IDA). This will also require exposing the nid to the user in
sysfs (i.e. /sys/bus/mhi/devices/mhix/mhix_IPCR/nid).

Thanks,
Youssef


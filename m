Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7396BC9830E
	for <ath11k@archiver.kernel.org>; Fri, 25 Sep 2026 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=; b=KqS+/Hrw5w9hTISXuJHlOOQhgh
	xKBPmncUzp5gL0z33YYjfhozu40GBorDvvwq3PIe5mNTtZxTvs9/BnK5HnQh3Apky09Ry4csCvw0V
	0s5nuFjqqDWlooOxpf9Hsj3UxDvds39QD2igaEc7htGuPIPPVq6b2y1YYnWUZR4HwtZ1lcMU7uNdn
	lJejOqt9ZTxqfGdx86KKRZdtWI1VCODDiejFnCh1uAUkt8wShR1tJZg7B6DL5LaILslmVmepLmhek
	Iwa/vPBSOX0WpkWIl5iFuRnagoeBQVvy0orYAxri+8EcdFQJgEahv1X/Rud4kj1pmRP6/tM4KqLYc
	FMXoM91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5KE-0000000DLgT-2hF6;
	Fri, 25 Sep 2026 12:46:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5KB-0000000DLfY-396e
	for ath11k@lists.infradead.org;
	Fri, 25 Sep 2026 12:46:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YYBY208408
	for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 12:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=; b=AYRND37lW8jWqGFV
	EMTeyG+FZKnEy5vL3U+fYits/0aiDIdPkPQkN9x0BSY8KieqAxlqH+FKJz/ovMl1
	pi+PW955ABRDkDegByWGk5OQwdAm7J0lyDupnHk8r2q6Q0wEuetM6EPfDud8Vtg+
	lnvBgp+TZAEux1kE5J6RJ4GYEhE1WxoVknRktqa87lERES3NKZD6FEymRfNyrxut
	jiw+M63dUTkdK4yjXpqbpbg4dQUpBIYjYUrKRKHKzh4LnutRe03FEDwTlzS0ndoL
	1oaAr5u1jyp3H20NIW452jfWhlhC6tML+hYaMhSg8EPIGEdrRxJVTetuiJfXsDWt
	JYPOhQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898ugpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 12:46:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9143cb073b9so5143546d6.1
        for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 05:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340406; cv=none;
        d=google.com; s=arc-20260327;
        b=j2Ydo0FnGMYWRDLqmgriNoERLYlPZjqkoYhHscigkWepbwgKJuarCrQcqlFzLF0KrN
         q81iqda9ly1ADdg2YqWWAW7w7Uf1HR0kdUTHhnfMOZWCw2pD14+bBxnMAwqo19k+8xeR
         sgj8/28mxQ+bB/oKVKt0CgV5+pfLjKRUFTaRJZ55zH7rWUl2gE+trqB934d+ifYuXEU1
         wr7nIrc6esO5F/dkcfvKneqaRKBlTmAgvcNihVylOIHbp98b0yv94V9if3eQ2E9f+4+d
         IU731pei4pWyU3iuektyYnsQYWtTn4/W7PFUKLQkqI+ChgZLPluHQ5qaDAKA333Ua7GV
         0Pzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        fh=9WxDRErrhAv2B6zWYBjePAsix1x5qMIvBQ1ANMNfJwg=;
        b=iNzcp05QvIRrroASUczH5+P/4c30Wpma+hdSH0iu1hfGIKNN5Ua6NX7Bs5G6DwBLk/
         w+fMvLhhgLrCskDR4WYPWvhzsYiDnzsiwqkK3GLGsJPhQYDHhejWin7aUTkW2E2baS+L
         93KWCrpJmKZiQ7t02moIBQ1mV7tyVvwrFYkqgVuqCUcy675iyVB3qmY2G/CrulLg6+ax
         rm+fjV8uiMoSFdd/Wz4wx/0aPB9azE38Pl7oVdKjCx9cvtR1Feq4hmG/upjwwoAwKqUE
         S9iYN4+WhFmuJmDjzb5PRSIiWa5wTwlkkISdV/1I0SQ5WIjse+QrIc7dmqPJcms5hnS1
         KhDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340406; x=1790945206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=A+gD0Xg2x4da8ObClB8yxCmE+JFJcEOdHcC9A0JcmdB8rn1TUEZxSTB+CD6dGetJIh
         jmlYIq3FBXPPfo9cpKWcwDPntBMGmVzQPiKTVfmpr5PlIXmtBIm7UUlPrnhNchq0BeBr
         Jgv18oUxrwrZBQfU8lhE+bsPnn7jSlYLrixLncbxjNVmyEqhfSs6v7LQdCXmaAwpG83X
         xiK7bEAusR0UEIgGS4uuH3ZYTqKmXIVEmj08MhY/WXWEjuSbuKdjV3KabyLth9xpEyIS
         B+vt+wa+q8EZpsQRPJ4ZpUvJxdZt3Gg/oef3vgPTl0/1n02JFJjq1XuQoISMS1TuFqA2
         c/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340406; x=1790945206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=Wi2nypy9l581nYKt6ps8WB7XOAtSymoW4l0lZ4RyysTaP/Q/QwDXyXN4vtrJz13D7Z
         cReNAny4YDPldyq9xvOnNs8C3hFLpQOgdgxNKEF8AgJPTt4KNiAORtqBAFu3A1QMREti
         OoHr6W27OwfBgMboeEZQ4dqRsWPaDBTDguKxdMWIm9YLpoXW2Stedhx6O79qSNf67Z1y
         zTtLeCx+jI7OdSJrSGP6HcZUJix6vJMasCYwUSK81gEGY5/fyvavKgv+b7k+q8zUXuPp
         CgUYWxqqPKbZD3DBxxf2l840WG0fu4p6OEq5mmrDjpwtw+zR4765KBVPfsVUGL4OD2Lq
         mREg==
X-Forwarded-Encrypted: i=1; AKwUvBxgYcc/CkGpyu2m/zacXJ83bzrCx7DF7IGBlKZxPQmkggxtwhnX04WFQa5qoru9v/9g1sLqWjQ=@lists.infradead.org
X-Gm-Message-State: AFuF++leHEFdMD/Yx0NNrlKLQ3N/scDutYApTuO3XKwMfEYoRq+/vP1d
	k+dm9tCp3/C00UC+JsTSNsQryUiIf7RmrzcHeEqOVmtpxnj93lNA+iP9KMx4/cIdd4krXRv3/hV
	9vvtdsD9i9Jl2EWc/qtKPnwOk8Z61yMJf5K/JnznTAtIFxwDOYn2UX3CdbvebeLHADcw+/30VxG
	3BQUIHZZucNbaWZmAF//9C5DIoFfSHb2uL2NmfSlo=
X-Gm-Gg: AYBFou0jrETtUWLc6HfpBrrrGJlXdfc4vh2JG7oP6W4Mpz5Uc2mGUGS5iHBQQbWZgbr
	vPHcYC3iCe2JiCquQ69RLJzCaX+KRNr+PIug0f8VoUuUEiEZdkT8j+rsNGIC0IjH5QU/G14Zbpg
	7q+Q63tweevfoklU8oXRz5A6cIbDyJuqxao2lGpkv0ZYQ/HCw9oxdjX97qXg==
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id 6a1803df08f44-9142f63ee23mr38807636d6.5.1790340405775;
        Fri, 25 Sep 2026 05:46:45 -0700 (PDT)
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id
 6a1803df08f44-9142f63ee23mr38807116d6.5.1790340405276; Fri, 25 Sep 2026
 05:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com> <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
In-Reply-To: <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:46:34 +0100
X-Gm-Features: AclHuK9M9IbbCEpkXjmHN3eWA-5m3q_sE1ucHvnsGGxug-EHSGOK9v70zRPAC84
Message-ID: <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfXy/JbhpF+4PNF
 7U9Gu5UOsZ3IgnTxKx4NXxBK/mUwyAehQ4cGatbvqzrCp+BfJokX6ylwFxRhbGzEXHUOrjTf8Ge
 7i/uleAO1vOlq5aJ2TjXnmFb0recuS9BhjAVRe1KNai1o5cpte+pMHdFTUZBR7isqZ5WyCfof3y
 ZGcHI8IWLNsUyDwYRUbfM6nGMVIKVUFodFGVa4Xt/2ZmXc+fIK3X7AtX/mgdRcm+DD4cKyHvQ7K
 GmvoQkySB8eVeqwy5rkrFDtluu5/0RJWj0mbrAAxHAZhNLMKNmJXNExO2pWA81TNod9PNuRNHxp
 Tz8tjpCQs70wnGI/p01eT5FDbRpD/29qoc6MkOX00zZ383Kh3aNLVV1TT3nnGP/CEFFSHay8yiO
 gyt8CK0QNKgVQWOTSzHPmV9/05BVhi/HOZHRyZHG2L+bFJdlcfbi8ee7RntoosHanjfPFVDkeKP
 JXmuu9jKkhE1ZajvCHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX8h1yEvU7VZcR
 53f+M9rab41jggHuhzrtBS4wOj5BS+RjJS8SNclxBziwySmbihjzXCJs0buqHNdn0+FT6dVuK4Z
 2XSHbYqArJywjk85Ddvzdocgdbl6STY=
X-Proofpoint-GUID: PUeB7x9Ootsq47XCW73MzTbsazLtkZAZ
X-Proofpoint-ORIG-GUID: PUeB7x9Ootsq47XCW73MzTbsazLtkZAZ
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab66d37 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=nOLRoRm-sisVCJmKiMYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_054647_793784_C6803532 
X-CRM114-Status: GOOD (  17.80  )
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

On Thu, Sep 24, 2026 at 4:58=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> > On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
> > <juha-matti.tilli@iki.fi> wrote:
> > >
> > > On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > > > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > +
> > The chance of collision is slim, but still not impossible.
>
> When you mean collision, do you mean node id collision due to bridged nod=
es?
> Because, even if the directly connected QAIC devices use 32bit node ids, =
the
> collision won't affect the functionality.
As in ep_nid of one device matching the nid of another device. In MHI,
that shouldn't
really matter since this patch moves away from using QRTR_EP_NID_AUTO in no=
de
assignment, but as you mentioned below, it could clash with TUN and SMD EPs=
 that
are already registered with their ep_nid.
>
> Also, there is a collision with SMD and TUN endpoints, but that's out of =
scope
> for this series.
I have not worked on a system that simultaneously uses different types of E=
Ps;
only MHI EPs. But if there is a real case of that, we can move to
global ID assignment
that includes SMD and TUN.

Thanks,
Youssef


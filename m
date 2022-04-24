Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BCEC433F5
	for <ath11k@archiver.kernel.org>; Sun, 24 Apr 2022 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoOabwkcC0qu2pONhvhZvut2M1Jr9sD65AEsMJBOXFM=; b=rHtvrQROYzFriC
	47DUQgruCcWKW+qY128w1+q3x/JBtD/dM60rd6egfYouzmjjEbIiPrdqk8hFDnlZGr8fnGErP3tyK
	28aWHe+Q9Y9BiqDk1xhfi8r4zWFRxVznU2auo2ZNJXwo5Gl4rEfV5fUhlISNtVPhJi6daoUMBNDOm
	amO3ekkXp+Uro1LuWPDSDFuDDHEYByZ87dik4DX+xkLuG81qZS2d2pqMjaqxUGqVZCsq5u4zlM0l7
	oNyuLk+GmCHqlPmxI9tc1HKWLWCypVks7X04lIUznFXof7L753vYeK40zxUs2t58bLmZeqea9kTeW
	w7bGFGBYTRKwa515GLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nieck-006tbR-Td; Sun, 24 Apr 2022 15:58:10 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nieci-006tb7-F2
 for ath11k@lists.infradead.org; Sun, 24 Apr 2022 15:58:09 +0000
Received: by mail-il1-x12a.google.com with SMTP id o5so7948139ils.11
 for <ath11k@lists.infradead.org>; Sun, 24 Apr 2022 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6RqcH5EjgX7ytAfXTbCYxpivFsdre1YhBcO8BbqSsOw=;
 b=EX3pBNpP+eniJ/6fc2pTgfXIHVQGv8CwWxK8zFS0pBV5rritL+mkEVVCHxVCwK9XGx
 DKLn3XKQF+J3O33cj0wQNupgeI3QG/kO1CiAow9qTxhxmdU/qffEAAQVJwiBnPwif1Du
 AxpKSa6zYD8tSOhAIckAqf6xGERTXEn8TD2tWYVf8LLBT8ysx9zTC292zalRgeBnM/f4
 0z6ECvj5HWzNbFs9T6aWecmyDxNyWEQYTAt4l7VM+3z/TyB2nnEQi72KoS3TWnXTZxgO
 p33CePt5iOTH9Q+ZlPboTJDnKTdaWsL6fV4SCOJNZVFq5g5dMSp9PCw44iv+A0LZgnBP
 pBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6RqcH5EjgX7ytAfXTbCYxpivFsdre1YhBcO8BbqSsOw=;
 b=AKwNVnzL7m/kZKWEKCKw1tcnAdsCKAOeouoQ84DZsqyTX7MK+pigND5ax2kaY9enHC
 LUJS55xyP7EujTzQPEIOg+JHIVYimdTG3HjeVnfQilc2AXGi+qCm1HDrygDS45NCtbkp
 3Z9lvHqaKe/WD7HPH2ycxQ8fVorai47Ia/ndChbUt7cMknbf4Kwcb7cP6+srOO04g8ww
 V4nIs5JKnoZloMkBz0Q2hs6HTrYC8UBJpTt3Hd7Qydlf4Cgyr5WTMs0GCjlzBDEJsr6w
 If/o3QhtlV8i/+m8OYP3yD+hJL5focn4yECGqji4LShpjLRqyY8OLoiEnthZdA9vaAqj
 Q3ew==
X-Gm-Message-State: AOAM5303lIWvTutVN1FB1QLMpEGxeugNzHF0wXwSVeJYjs2Riz97SPAX
 smMIiwLBuHKkZ9bmW1RYvTV3POGLd5GXcw5Q9UOGrw==
X-Google-Smtp-Source: ABdhPJyv8yCBv2HVhIaRg0EDCAXfBjwVUdXHjlY90X/BLrkPA3kJIN2Z70lARG6IoitNwfH5DNPDnDlzrJgnm208coQ=
X-Received: by 2002:a05:6e02:19c8:b0:2cd:7ff9:72ac with SMTP id
 r8-20020a056e0219c800b002cd7ff972acmr3019062ill.159.1650815887043; Sun, 24
 Apr 2022 08:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
 <b208fb8c-b7d2-6fe6-3429-a2ca9d7fb59b@quicinc.com>
In-Reply-To: <b208fb8c-b7d2-6fe6-3429-a2ca9d7fb59b@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sun, 24 Apr 2022 17:57:56 +0200
Message-ID: <CA+HBbNF+cPayaLBF3TFQasxQWCyAFzBad++chwVko2_geSd0Mw@mail.gmail.com>
Subject: Re: ath11k: does qmi support multiple soc
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: fengbin <arithdon@gmail.com>, ath11k@lists.infradead.org, 
 Anilkumar Kolli <quic_akolli@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_085808_538314_0E1C3811 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Apr 22, 2022 at 5:47 PM Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 4/18/2022 1:37 AM, fengbin wrote:
> > Hello,
> > I have qca6390 and qcn9074 both of them works fine individually.
> > However when I install them together errors show up.
>
> This is a known issue. A solution is under development.

Hi Jeff,
thanks for confirming the issue.

Regards,
Robert
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

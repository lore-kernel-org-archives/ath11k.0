Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4B60A2608
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkXzntRa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQR5k/S5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=; b=pkXzntRa8HLqwV
	m8ekV/A1Hyrt2tXPiFT05Wp99d+KA4N42ZOXGlBDzESxaJag0I9ebiTfD8ASbrKuOlmUfF5l6vc+o
	tRiy9HtXqmXFQz9dP392PN0j4GkKzLuEVrR2anCKNg5s3EEMfk78R4bNE4rTSlmsPDiLRhlgl2eC7
	7TfQiTIWZ2/SUsDU4vCadmrqGAlVBUmGhnmtq55Z/I6uSnit5xqduoNqFle+1KzLQZcg4+JeSryIL
	CIArqNHoiR9LeXOOIuHizMbJ/CEhfhnaYqejMzkfKYLkN2G/m6QSaXhICLmvCprwAAj20L1I9tFbM
	wy8DES4Gi0tw//Un+qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyYY-0000000BPeX-0k0y;
	Thu, 19 Nov 2026 09:35:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyYT-0000000BPaQ-2J0L
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=EQR5k/S5gX9O2isyt9+JvCb312lvuQU3o+Tqp4+vCflfecSErAFIy3ykBo3xSvgGk7dPsT
	WtLZujzuVFLpnfLmbSdniorq0OACjUOdcLIFEz/ECXMSvzNp4wZQd8wSw/fRHMsunSPAJf
	JibFbSVVIP21JAtWnem5KUV1Mh1omDw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-Rhc59mljO-SJbVjWo07biw-1; Thu, 19 Nov 2026 04:35:41 -0500
X-MC-Unique: Rhc59mljO-SJbVjWo07biw-1
X-Mimecast-MFC-AGG-ID: Rhc59mljO-SJbVjWo07biw_1795080940
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490d2ac331bso1916077f8f.0
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 01:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080940; x=1795685740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=qFokTaa4jtKxT42U49UhbfRic/s8zQMiqPkT8s2qq8xyDUBh0NayPj4fxrnQb3A5bJ
         nyB1U4mzdiksWRhumh4h/cs0yoa+fSkms1U0GT7tOkaparyHPd5c/HA0BCzHVBA+gzAz
         RcGct88omiJf9WDvBZQd66EYtSiQtXsxevBrvsE7ycFF7ez7zsnN1JnKT5LYhY8WFqow
         ReeOQaF1MJ+QmtG7xvteMJr1lMPoJQR6+lW8OGBR5Bu7JkiMBeSJ9W9g3i5moGy9hTAz
         0B8/ZwbvuUwcm/kYjmhbSUZSKy/N86T48aZCsaCdYGHRhNJ3KSqCxP3HYHLTHZZ2XLWk
         pTQw==
X-Forwarded-Encrypted: i=1; AL+hErEFzMxOboMEtJpg50Opj+DvZ5U5makrlvlhKemfst73D0etV9NjhWRAS5t1/NcxTGQixuHRdXs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+l/VboUNkoZ5YwnCJxNRrL54EbjodGQ2FpiE6l/Js9NmWPdK6X
	HgyEUri5XkXD01STvjijgpIiybsCaujPLnuO9HjVAjncLRRYfaXqfmzxXr9RxQuBlUwtfH6QUD0
	dqMjIQ3QitU31tgdZzZZqY4S92U0lrxOdno//qTgm4HkGP/LiSDqEZTAihPMUXyU=
X-Gm-Gg: AZFdTZdS2mmunkM5mLWOK3WopXas6fZaB0ix2jio+oNJhedSfvjv1o1G5bK7LNONtaS
	TyrsBqTRT3JnuYLhNrZ+ZmgB1xuvM7icYLSYc3vm0V4Hwwee1V0CKznqkYK0bnW4tZPaid3Mnyd
	0cKa8hQeBjzOlf09wOnr3au8SbYUNuMVdPFU5RxmKj3YPyySdCJf6ivlKRq/OPMCol5RfbQ0OEH
	q9YhlRRKzkZIqPljYi/B3hEGb0z3/p530h1K+Ye0De5COkwGGOIDMt5X2jtBCjPNBOhDxkghI5t
	9C6RtId062yVC9HePGt0w8WScfS86esDr9NEHrCTD5IvEDoiY/kmTAD6XyyO/bvuiaDCfslUIQa
	JdXS3u7G/6VmG17y5twHgB72To0Hh35Pnu9vtQDKazAiiX7YdEVLMurNxehnQ8k5uWmdLGNtKBe
	+YK0H6QuVrtNy3DmEQnLIZzucSzPNrkyxn0bqk6I6nq7ET
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817851f8f.34.1795080939768;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817756f8f.34.1795080939199;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm9495655f8f.17.2026.11.19.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:35:38 -0800 (PST)
Message-ID: <4eea6d32-4200-4cd1-860a-70e81356678e@redhat.com>
Date: Thu, 19 Nov 2026 10:35:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign
 a unique node id
To: netdev-bot+sashiko@kernel.org, manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 jjohnson@kernel.org, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com, daizhuang.bai@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com
References: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
 <179478985187.3136.15328141866524028119@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179478985187.3136.15328141866524028119@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zGmjDsI_lH2JZZ8l3_94PQgtfHnYeyZsksUpOvI_KjM_1795080940
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013545_748285_BBEED1A7 
X-CRM114-Status: GOOD (  10.73  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 01:44, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] A failed node-id insert now drops the packet, where the old
>    code still delivered it, and a dropped HELLO is never recovered.
> - [Medium] In AUTO mode, nid and ep_nid can end up different, which the
>    commit message says cannot happen, and the rewrite logic then…

The first concern above looks relevant, and the 2nd deserves at least an
explicit answer.

In general you need to address (either debate or fix) every AI comment with
prio >= Mid.

Next patch as more of such comments.

/P



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F201EC0218D
	for <ath11k@archiver.kernel.org>; Wed, 29 Jan 2025 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exsChHtW69nKPxO2SwyiGN3eD6hQvwSXjAHeNS9bLyI=; b=Smk2Ibah31soGKR61KFOHLhhxU
	bBv3UOZusCFn8reCi5AGrXR5+iSfXk9ESwThIg2JV9YIg3dmiLSpdTZffCB6uTfuBGdCokjilV8kT
	dTsbzgURQzm+k5ZtLj379bttnLIyURKUrRuxczNs6mhUwTTsXVlwg93KTrnqAoRwiRhAACnWTbdp/
	wxFStnC2GWXUKC3Enl85SgUkvy0LbNTqYZ+v/YDWQwBAmP7ggYulirQ2gmwIEnMfE1G4ffGTLpWd+
	ggbIoN05SNyx5/SUcU5dIu6rM+lfVmJWdatVfpQJUP4Y2LWvYsTRR3x69h8at3mMQ9ttISpH4VStE
	m+hHYcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4DX-00000006df1-1Ttl;
	Wed, 29 Jan 2025 09:18:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4DU-00000006ddk-15h9
	for ath11k@lists.infradead.org;
	Wed, 29 Jan 2025 09:18:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso5778104f8f.0
        for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 01:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142314; x=1738747114; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exsChHtW69nKPxO2SwyiGN3eD6hQvwSXjAHeNS9bLyI=;
        b=Qj3/66wbZFurU2QXpC+H8/9f9SvvpQcRG9JQ4xuUXtSiM8it/qDi7FS4cdG5jKfKFS
         tl7aoHrajl1h3Hwel74YGUa+sHDuByEvz+lcb4YF+QvoSN06RBKd6vd3l3idYBFwBXki
         cTAYZF2rDcu0ZlL+Dogf2xe2Im9qY4OSlR8vss4gJJHX/9z9Tk7Qiqg254hQHOEzt0tm
         rM/+xOTMG09Zq9h3EMWfN8d6Kcesc0enpvB93Uoq0MgamjPglTJ69b+edcfiA6tLmNOI
         GwrElNJtF7VjMMHu/CDCw/nrl/wrGVBb9xXmzb4i2RNq3vLCD820VMn2FXAP+ZYYpINW
         oSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142314; x=1738747114;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exsChHtW69nKPxO2SwyiGN3eD6hQvwSXjAHeNS9bLyI=;
        b=eASkJttwmk/66N8NbWG6oaoBypHiNXQ/XDykGxg76sC+6WyFtytEEYz21f/Yn15M3e
         GAWujJuVB7CjYUOJHxpEHwlDwTH53k5NAV6VJdDjM63DgdKRQSXqR+yy4Jn7zK43IQ+C
         oPXrE4qoonKBFkB8i7yVle5O1N4nsGsYBT/k+a8bZeyN3EaG9dJTRWfgPRCVegzS5soH
         3gfzKY5xSQHjWplgH59yHecmTcrc7iAL+gGEziB4Qn2dSllII4yiNd6rbr4M6Cma4sOn
         CcsR4olv5/5mC4Uv+S6hn+1S+GDlzml0067rTQR8nbrCwVurlQtNjHgZwdbvV857P1Pp
         ZW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqwyzA26S2AOawNy/Rqr877ymfsRwV/NpG4olMNyCx+P1WR5Gfg64EjC1scwdkOnl4PTyjZBU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMi0wy0i3Rj3edI544KJgwSMGzyIDcO7uVnGpCIqUfA/xHpwcs
	PG19PE/nVvhGjgttTxgFTV6JG3XyM7/DLx5czKMGLBaTjERL8WfNhCn3NA==
X-Gm-Gg: ASbGncuIbMlowj2jC2XdAWhS0YjL7pgPRy0klW3xie/mqBERksiKi/neuSiYAjST0Jh
	xc9Z+R55XfN8aDfKEwHpo8HIZsMTSHfl6jYMas8fw8gyQRT1L9b7AwRaWsWIK6URULALa3RBWLv
	R5ra3eIjgXjz/OLyPwFUqxkiH2j7zRTknqMBGanegmuFcdPr7fBg0UqLvyBhD/rxUhiPPCjPTIV
	JKvOQ6EuipWx3RsfgOClMFhDiOEOFF+MdDskz8Somv+YqIGhRFfMPrATKMx8UqlA7R7fsegxPQg
	P0IZht6W0duIrdwYAun/999gED8IdqevzQ==
X-Google-Smtp-Source: AGHT+IHBGgwN2De4Zj+PbX+xrtplnjXEp3cf0p+3b/NxZHv/aU1YEPLlOQfWVSldtA32B0LzDwdT3A==
X-Received: by 2002:a05:6000:1863:b0:385:fc00:f5e1 with SMTP id ffacd0b85a97d-38c519391afmr1800291f8f.9.1738142314062;
        Wed, 29 Jan 2025 01:18:34 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad92sm16470675f8f.61.2025.01.29.01.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:18:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 10:18:32 +0100
Message-Id: <D7EG0ZAD9USJ.2UCEVJJNB45LF@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: remove peer extra rssi update
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath11k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250117181953.3375273-1-nico.escande@gmail.com>
 <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
 <dd5d8193-3b35-4eac-b551-4dce5e82c3f9@oss.qualcomm.com>
In-Reply-To: <dd5d8193-3b35-4eac-b551-4dce5e82c3f9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011836_298197_092ADD7E 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed Jan 29, 2025 at 1:08 AM CET, Jeff Johnson wrote:
> On 1/28/2025 2:29 PM, Jeff Johnson wrote:
>> On 1/17/2025 10:19 AM, Nicolas Escande wrote:
>>> Commit b205ce4c266c (ath11k: support avg signal in station dump) added =
an
>>=20
>> I'll fixup this reference to address the checkpatch error:
>> ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12=
+ chars of sha1> ("<title line>")' - ie: 'Commit b205ce4c266c ("ath11k: sup=
port avg signal in station dump")'
>> total: 1 errors, 0 warnings, 0 checks, 8 lines checked
>>=20
>>> extra assignment of arsta->rssi_comb in ath11k_dp_rx_update_peer_stats
>>> when it added the average rssi support. So lets keeps only one by remov=
ing
>>> the legacy assignment so the two statements about rssi stay next to eac=
h
>>> other. Compile tested only.
>
> I actually made three fixups, please check:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=3Dp=
ending&id=3D7946ec554fbea5db9a3aedb7087f0eb9e3749abc
>
> 1) commit reference
> 2) add () to function name
> 3) lets =3D> let's

Thanks, it looks perfect.


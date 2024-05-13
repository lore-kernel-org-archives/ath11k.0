Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F696C25B10
	for <ath11k@archiver.kernel.org>; Mon, 13 May 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Date:Message-ID:Mime-Version:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zoAN9OnZFnHrrjG5pXzGLJk9lnHnZIPXda5lJlVSyf4=; b=yUdXx5uH6tCBabeFHCDmQqrGd4
	dMEQuP7zdlMts+pvufKdMqdSjpi6UuzC5vQx6Bs2tG95dHDzoiLESCGp8PfXpwOfNz6Ft26JZJNqc
	ir3fHD1IMeRXPHZwDWtQe0+Ydb/bYtTlrb6DT386+jEpiVRvnY8lOd3pbnc5x14ez/vrQ4dLTZmfL
	z8bMHa5qLu1npbSXUSKxBqDHunxYhCgX6dv27gO7lmGKzOhTq5dCtN3y5RPlejqTUxc9FR2N09Dc/
	38YOnQJ91eI+OXOa84yN1lCereApUjDb3HtGVZxZ3ExKMqREaIQO8HpNzG3d+3ddAqngNCelvU0qy
	FxIHZopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6XTz-0000000DL5Q-21Eb;
	Mon, 13 May 2024 15:20:55 +0000
Received: from [137.220.190.155] (helo=mail0.sfe61.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6XTv-0000000DL4L-1rVM
	for ath11k@lists.infradead.org;
	Mon, 13 May 2024 15:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=sfe61.com;
 h=From:To:Subject:Mime-Version:Message-ID:Date:Content-Type:
 Content-Transfer-Encoding; i=no-reply@sfe61.com;
 bh=zoAN9OnZFnHrrjG5pXzGLJk9lnHnZIPXda5lJlVSyf4=;
 b=0qpKTfMxzQPo3lQ5dejawRHLQAjpIfgEQQGAqY6yYDd6T7P/sIcFRPuCBCqSIMXwpdrHKKGKy6Nx
   yeOdtavaG/MDgLJhhmvOLr707UJ/VAFDz7SKriZ44hT9vU5pPInnEMGu7jpQfZUcU/bbHDQHsnCK
   sB+0Dy693JtFDT8bdo4=
From: =?utf-8?Q?=E8=87=AA=E5=8B=95=E3=83=A1=E3=83=BC=E3=83=AB=E9=80=9A=E7=9F=A5?= <no-reply@sfe61.com>
To: "=?utf-8?Q?ath11k@lists.infradead.org?=" <ath11k@lists.infradead.org>
Subject: =?utf-8?Q?=E3=80=90_=E3=82=A4=E3=82=AA=E3=83=B3=E3=82=AB?=
	=?utf-8?Q?=E3=83=BC=E3=83=89_=E3=80=91=E6=B1=BA=E6=B8=88=E5=AE=8C?=
	=?utf-8?Q?=E4=BA=86=E3=81=AE=E3=81=8A=E7=9F=A5=E3=82=89=E3=81=9B?=
Mime-Version: 1.0
Message-ID: <tencent_6940C00EF80EE33992F3DE69@sfe61.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-QQ-Mailer: QQMail 2.x
Date: Mon, 13 May 2024 23:10:36 +0800
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_082051_975480_7656A1DE 
X-CRM114-Status: UNSURE (   1.81  )
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

=E3=82=A4=E3=82=AA=E3=83=B3=E3=82=AB=E3=83=BC=E3=83=89=E3=82=AF=E3=83=A9=E3=
=82=B7=E3=83=83=E3=82=AF=E2=80=BB=E4=BC=9A=E5=93=A1 ath11k@lists.infradead.=
org=0D=0A=0D=0A=E3=81=93=E3=81=AE=E3=81=9F=E3=81=B3=E3=81=AF=E3=82=A4=E3=82=
=AA=E3=83=B3=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E3=81=94=E5=88=A9=E7=94=A8=
=E3=81=84=E3=81=9F=E3=81=A0=E3=81=8D=E3=80=81=E8=AA=A0=E3=81=AB=E3=81=82=E3=
=82=8A=E3=81=8C=E3=81=A8=E3=81=86=E3=81=94=E3=81=96=E3=81=84=E3=81=BE=E3=81=
=99=E3=80=82=0D=0A=E6=98=A8=E6=97=A5=E3=80=81=E3=81=8A=E5=AE=A2=E6=A7=98=E3=
=81=AE=E3=82=AF=E3=83=AC=E3=82=B8=E3=83=83=E3=83=88=E3=82=AB=E3=83=BC=E3=83=
=89=E3=81=A7=E6=B6=88=E8=B2=BB=E6=94=AF=E5=87=BA=E3=81=8C=E7=99=BA=E7=94=9F=
=E3=81=97=E3=81=9F=E3=81=93=E3=81=A8=E3=82=92=E3=81=8A=E7=9F=A5=E3=82=89=E3=
=81=9B=E3=81=84=E3=81=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=0D=0A=E3=81=9D=
=E3=81=AE=E6=94=AF=E6=89=95=E3=81=84=E3=81=AE=E8=A9=B3=E7=B4=B0=E3=81=AF=E6=
=AC=A1=E3=81=AE=E3=81=A8=E3=81=8A=E3=82=8A=E3=81=A7=E3=81=99=E3=80=82=0D=0A=
=E3=81=94 =E5=88=A9 =E7=94=A8 =E6=97=A5 =E6=99=82 =EF=BC=9A2024=E5=B9=B405=
=E6=9C=8813=E6=97=A5 21:49 PM=0D=0A=E3=81=94 =E5=88=A9 =E7=94=A8 =E5=A0=B4 =
=E6=89=80 =EF=BC=9A=E5=8D=83=E4=BB=A3=E7=94=B0=E4=B8=80=E3=83=84=E6=A9=8B 1=
 =E4=B8=81=E7=9B=AE=E5=BA=97 (=E3=82=BB=E3=83=96=E3=83=B3=E3=82=A4=E3=83=AC=
=E3=83=96=E3=83=B3)=0D=0A=E3=81=94 =E5=88=A9 =E7=94=A8 =E9=87=91 =E9=A1=8D =
=EF=BC=9A9530=E5=86=86=0D=0A=0D=0A=E3=82=AB=E3=83=BC=E3=83=89=E3=82=92=E4=
=BD=BF=E7=94=A8=E3=81=97=E3=81=9F=E8=A6=9A=E3=81=88=E3=81=8C=E3=81=AA=E3=81=
=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E4=BB=A5=E4=B8=8B=E3=81=AE=E3=83=AA=
=E3=83=B3=E3=82=AF=E3=82=92=E3=82=AF=E3=83=AA=E3=83=83=E3=82=AF=E3=81=97=E3=
=81=A6=E3=82=AF=E3=83=AC=E3=82=B8=E3=83=83=E3=83=88 =E3=82=AB=E3=83=BC=E3=
=83=89=E6=94=AF=E6=89=95=E3=81=84=E3=81=AE=E6=89=BF=E8=AA=8D=E3=82=92=E3=82=
=AD=E3=83=A3=E3=83=B3=E3=82=BB=E3=83=AB=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=
=E3=81=95=E3=81=84=E3=80=82=0D=0Ahttps://pnemetzmills.com=0D=0A=0D=0A=E3=82=
=A4=E3=82=AA=E3=83=B3NET=E3=81=AB=E3=81=94=E7=99=BB=E9=8C=B2=E3=81=84=E3=81=
=9F=E3=81=A0=E3=81=84=E3=81=A6=E3=81=84=E3=82=8B=E3=83=A1=E3=83=BC=E3=83=AB=
=E3=82=A2=E3=83=89=E3=83=AC=E3=82=B9=E3=81=B8=E3=81=8A=E7=9F=A5=E3=82=89=E3=
=81=9B=E3=81=99=E3=82=8B=E3=82=B5=E3=83=BC=E3=83=93=E3=82=B9=E3=81=A7=E3=81=
=99=E3=80=82=0D=0A-----------------------------------=0D=0A=E2=96=A0 =E7=99=
=BA =E8=A1=8C =E8=80=85 =E2=96=A0=0D=0A=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE=
=E3=82=A4=E3=82=AA=E3=83=B3=E9=8A=80=E8=A1=8C=0D=0A=E2=96=A0 =E6=A5=AD=E5=
=8B=99=E5=8F=97=E8=A8=97=E4=BC=9A=E7=A4=BE =E2=96=A0=0D=0A=E3=82=A4=E3=82=
=AA=E3=83=B3=E3=83=95=E3=82=A3=E3=83=8A=E3=83=B3=E3=82=B7=E3=83=A3=E3=83=AB=
=E3=82=B5=E3=83=BC=E3=83=93=E3=82=B9=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE



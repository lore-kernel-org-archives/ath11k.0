Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEEPG-0007YN-2B
 for ath11k@lists.infradead.org; Tue, 17 Mar 2020 15:45:28 +0000
Received: by mail-vs1-xe44.google.com with SMTP id 7so14134124vsr.10
 for <ath11k@lists.infradead.org>; Tue, 17 Mar 2020 08:45:24 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id k123sm1466693vkk.52.2020.03.17.08.45.22
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 08:45:22 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id a63so4213869vsa.8
 for <ath11k@lists.infradead.org>; Tue, 17 Mar 2020 08:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200103045016.12459-1-wgong@codeaurora.org>
 <20200105.144704.221506192255563950.davem@davemloft.net>
 <CAD=FV=WiceRwLUS1sdL_W=ELKYZ9zKE13e8vx9SO0+tRvX74QQ@mail.gmail.com>
 <20200317102604.GD1130294@kroah.com>
In-Reply-To: <20200317102604.GD1130294@kroah.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Mar 2020 08:45:09 -0700
Message-ID: <CAD=FV=XXPACnPt=5=7gH3L6DufZ4tLSPTN-AtTAmvi5KAJuP6A@mail.gmail.com>
Subject: Re: [PATCH v2] net: qrtr: fix len of skb_put_padto in
 qrtr_node_enqueue
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Greg KH <greg@kroah.com>
Cc: netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, ath11k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>, David Miller <davem@davemloft.net>

Hi,

On Tue, Mar 17, 2020 at 3:26 AM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Feb 25, 2020 at 02:52:24PM -0800, Doug Anderson wrote:
> > Hi,
> >
> >
> > On Sun, Jan 5, 2020 at 2:47 PM David Miller <davem@davemloft.net> wrote:
> > >
> > > From: Wen Gong <wgong@codeaurora.org>
> > > Date: Fri,  3 Jan 2020 12:50:16 +0800
> > >
> > > > The len used for skb_put_padto is wrong, it need to add len of hdr.
> > >
> > > Thanks, applied.
> >
> > I noticed this patch is in mainline now as:
> >
> > ce57785bf91b net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
> >
> > Though I'm not an expert on the code, it feels like a stable candidate
> > unless someone objects.
>
> Stable candidate for what tree(s)?

I noticed that it was lacking and applied cleanly on 5.4.  As of
5.4.25 it's still not stable there.  I only noticed it because I was
comparing all the patches in mainline in "net/qrtr" with what we had
in our tree and stumbled upon this one.

Looking at it a little more carefully, I guess you could say:

Fixes: e7044482c8ac ("net: qrtr: Pass source and destination to
enqueue functions")

...though it will be trickier to apply past commit 194ccc88297a ("net:
qrtr: Support decoding incoming v2 packets") just because the math
changed.

-Doug

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

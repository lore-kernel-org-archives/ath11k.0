Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEptD-0005eP-7z
 for ath11k@lists.infradead.org; Thu, 19 Mar 2020 07:46:52 +0000
Date: Thu, 19 Mar 2020 08:46:34 +0100
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2] net: qrtr: fix len of skb_put_padto in
 qrtr_node_enqueue
Message-ID: <20200319074634.GA3421780@kroah.com>
References: <20200103045016.12459-1-wgong@codeaurora.org>
 <20200105.144704.221506192255563950.davem@davemloft.net>
 <CAD=FV=WiceRwLUS1sdL_W=ELKYZ9zKE13e8vx9SO0+tRvX74QQ@mail.gmail.com>
 <20200317102604.GD1130294@kroah.com>
 <CAD=FV=XXPACnPt=5=7gH3L6DufZ4tLSPTN-AtTAmvi5KAJuP6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XXPACnPt=5=7gH3L6DufZ4tLSPTN-AtTAmvi5KAJuP6A@mail.gmail.com>
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
To: Doug Anderson <dianders@chromium.org>
Cc: netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, ath11k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>, David Miller <davem@davemloft.net>

On Tue, Mar 17, 2020 at 08:45:09AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Mar 17, 2020 at 3:26 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Tue, Feb 25, 2020 at 02:52:24PM -0800, Doug Anderson wrote:
> > > Hi,
> > >
> > >
> > > On Sun, Jan 5, 2020 at 2:47 PM David Miller <davem@davemloft.net> wrote:
> > > >
> > > > From: Wen Gong <wgong@codeaurora.org>
> > > > Date: Fri,  3 Jan 2020 12:50:16 +0800
> > > >
> > > > > The len used for skb_put_padto is wrong, it need to add len of hdr.
> > > >
> > > > Thanks, applied.
> > >
> > > I noticed this patch is in mainline now as:
> > >
> > > ce57785bf91b net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
> > >
> > > Though I'm not an expert on the code, it feels like a stable candidate
> > > unless someone objects.
> >
> > Stable candidate for what tree(s)?
> 
> I noticed that it was lacking and applied cleanly on 5.4.  As of
> 5.4.25 it's still not stable there.  I only noticed it because I was
> comparing all the patches in mainline in "net/qrtr" with what we had
> in our tree and stumbled upon this one.
> 
> Looking at it a little more carefully, I guess you could say:
> 
> Fixes: e7044482c8ac ("net: qrtr: Pass source and destination to
> enqueue functions")
> 
> ...though it will be trickier to apply past commit 194ccc88297a ("net:
> qrtr: Support decoding incoming v2 packets") just because the math
> changed.

Given that both of those commits showed up in 4.15, it doesn't matter
much :)

I've queued this up for 5.4.y and 4.19.y now, thanks.

greg k-h

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
